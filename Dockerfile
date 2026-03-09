# ARG must be declared before first FROM to be usable in FROM instructions
ARG BASE_IMAGE=ghcr.io/openclaw/openclaw-browser:latest

FROM golang:1.26-alpine AS blogwatcher-builder
RUN go install github.com/Hyaxia/blogwatcher/cmd/blogwatcher@latest

FROM ${BASE_IMAGE}

USER root

# UID/GID in one layer (almost never changes)
RUN usermod -u 1500 node \
    && groupmod -g 1500 node \
    && groupadd --gid 2500 obsidian \
    && usermod -aG obsidian node \
    && chown -R 1500:1500 /app \
    && chown -R 1500:1500 /home/node

# System packages (rarely changes)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    python3-pip \
    curl \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Whisper — install + pre-download model in one layer, no pip cache
RUN pip3 install openai-whisper --break-system-packages --no-cache-dir \
    && python3 -c "import whisper; whisper.load_model('base')"

# blogwatcher (busts only when the Go binary changes)
COPY --from=blogwatcher-builder /go/bin/blogwatcher /usr/local/bin/blogwatcher

# npm packages in one layer; clean cache immediately to keep layer small
# Full playwright (not playwright-core) — required for playwright API to work correctly
RUN npm install -g mcporter playwright \
    && npm cache clean --force

# Playwright browser binaries as node user, system deps as root
USER node
RUN npx playwright install

USER root
RUN npx playwright install-deps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER node
