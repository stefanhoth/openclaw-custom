# ARG must be declared before first FROM to be usable in FROM instructions
ARG BASE_IMAGE=ghcr.io/openclaw/openclaw:2026.3.12

FROM golang:1.26-alpine AS blogwatcher-builder
RUN go install github.com/Hyaxia/blogwatcher/cmd/blogwatcher@latest

FROM ${BASE_IMAGE}

USER root

# Compile cache dir for NODE_COMPILE_CACHE (startup optimisation)
RUN mkdir -p /var/tmp/openclaw-compile-cache \
    && chown 1500:1500 /var/tmp/openclaw-compile-cache

# UID/GID in one layer (almost never changes)
RUN usermod -u 1500 node \
    && groupmod -g 1500 node \
    && groupadd --gid 2500 obsidian \
    && usermod -aG obsidian node \
    && chown -R 1500:1500 /app \
    && chown -R 1500:1500 /home/node

# set up github cli release packages https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian
# and required system packages   
RUN sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& sudo mkdir -p -m 755 /etc/apt/sources.list.d \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    python3-pip \
    curl \
    git \
    gh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Whisper — install + pre-download model in one layer, no pip cache
RUN pip3 install openai-whisper --break-system-packages --no-cache-dir \
    && python3 -c "import whisper; whisper.load_model('base')"

# blogwatcher (busts only when the Go binary changes)
COPY --from=blogwatcher-builder /go/bin/blogwatcher /usr/local/bin/blogwatcher

# Download CHANGELOG from upstream openclaw repo
RUN curl -o /app/CHANGELOG.md https://raw.githubusercontent.com/openclaw/openclaw/main/CHANGELOG.md

# npm packages in one layer; clean cache immediately to keep layer small
# Full playwright (not playwright-core) — required for playwright API to work correctly
RUN npm install -g mcporter playwright @steipete/summarize \
    && npm cache clean --force

# Playwright browser binaries as node user, system deps as root
USER node
RUN npx playwright install chromium

USER root
RUN npx playwright install-deps chromium \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Ensure OpenClaw can find playwright's chromium without config changes
RUN ln -s $(find /home/node/.cache/ms-playwright -name "chrome" -path "*/chrome-linux64/chrome" | head -1) /usr/bin/chromium

# ensure openclaw creates folders/files with group-writable rights to allow for cross-user collaboration
RUN sed -i '3i umask 0002' /usr/local/bin/docker-entrypoint.sh

USER node
