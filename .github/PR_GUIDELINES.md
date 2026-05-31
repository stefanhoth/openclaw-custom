# 📝 PR Summary & Priorisierungsrichtlinien

## Leitfaden für hochwertige Pull Request Summaries

Dieses Dokument definiert Best Practices für aussagekräftige PR-Beschreibungen im `openclaw-custom` Projekt.

---

## 🎯 PR-Summary Struktur

Ein guter PR-Summary folgt diesem Muster:

### 1. **Titel (Title)**
- Prägnant und aussagekräftig
- Nutze Conventional Commits: `feat(scope): description`, `fix(scope): description`, `chore(scope): description`
- Beispiele:
  - `feat(openclaw): update base image to v2026.4.12`
  - `fix(docker-compose): correct umask configuration for gateway`
  - `chore(dependencies): update playwright to latest version`

### 2. **Zusammenfassung (Summary)**
- 1-3 Sätze, was sich ändert
- **NICHT** beschreiben, wie es gemacht wird (Code tut das)
- Fokus auf **WARUM** die Änderung wichtig ist

**❌ Schlecht:**
> "Aktualisiert den Base-Image Tag auf v2026.4.12 indem die Dockerfile Zeile 2 geändert wird"

**✅ Gut:**
> "Updated base image to v2026.4.12 which includes critical security patches and performance improvements for the Playwright browser integration"

### 3. **Priorisierungsempfehlung (Priority)**

#### 🔴 KRITISCH (Critical)
**Wann:** Nur wenn Production beeinträchtigt oder Sicherheit gefährdet
- Security Vulnerabilities
- Production Outages
- Kritische Bugs in Release-Versionen

**Vorgehen:** Sofortiges Review und Merge anstreben

#### 🟠 HOCH (High)
**Wann:** Wichtig für nächsten Release oder erhebliche Verbesserung
- Feature-Releases
- Wichtige Dependency-Updates
- Performance-Optimierungen
- Sicherheits-Verbesserungen (nicht kritisch)

**Vorgehen:** Priorität im Sprint, schnelles Review

#### 🟡 MITTEL (Medium)
**Wann:** Normale Arbeit, regelmäßige Verbesserungen
- Regelmäßige Dependency-Updates
- Code-Qualität-Verbesserungen
- Neue Features mit Backlog-Priorität
- Dokumentation-Updates

**Vorgehen:** Normales Review-Tempo, kann geplant werden

#### 🟢 NIEDRIG (Low)
**Wann:** Nice-to-have, kann später gemacht werden
- Minor Documentation Updates
- Kleine Code-Refactorings
- Typo-Fixes
- Experimentelle Features

**Vorgehen:** Backlog, bei verfügbarer Kapazität bearbeiten

---

## ✅ Konkrete Beispiele für dieses Projekt

### Beispiel 1: Base Image Update
```markdown
## 📋 Zusammenfassung
Updates OpenClaw base image from v2026.4.11 to v2026.4.12

## 🎯 Zweck und Nutzen
- Includes security patches for glibc
- Improvements to playwright browser support
- Better handling of concurrent connections

## ⚡ Priorität: 🟠 HOCH

### Begründung
Der Base-Image ist das Fundament für alle Werkzeuge. 
Security-Updates sollten zeitnah eingespielt werden.
Die Playwright-Verbesserungen erhöhen Stabilität.

## ✅ Getestete Komponenten
- [x] Docker build erfolgreich
- [x] docker-compose up funktioniert
- [x] Playwright browser funktioniert
```

### Beispiel 2: Dependency Update
```markdown
## 📋 Zusammenfassung
Update Playwright to v1.45.0

## 🎯 Zweck und Nutzen
- Bug fixes in browser automation
- Minor performance improvements
- Security patches in Chromium

## ⚡ Priorität: 🟡 MITTEL

### Begründung
Regelmäßiges Dependency-Update ohne Breaking Changes.
Neue Version ist stabil und wird von der Community genutzt.
Kann im normalen Sprint-Tempo eingepflegt werden.
```

### Beispiel 3: Documentation
```markdown
## 📋 Zusammenfassung
Add troubleshooting guide for browser issues

## ⚡ Priorität: 🟢 NIEDRIG

### Begründung
Reine Dokumentation, nicht für Release nötig.
Hilft zukünftigen Entwicklern, aber blockiert nichts.
Kann in downtime erstellt werden.
```

---

## 🔍 Priorisierungs-Entscheidungsbaum

```
START: Neue PR?
  |
  +-- Ist es ein Security-Fix? → JA → 🔴 KRITISCH
  |
  +-- Beeinträchtigt es Production? → JA → 🔴 KRITISCH
  |
  +-- Ist es für nächsten Release geplant? 
      |
      +-- JA → 🟠 HOCH
      |
      +-- NEIN → Ist es eine große Verbesserung?
          |
          +-- JA → 🟠 HOCH
          |
          +-- NEIN → Ist es ein regelmäßiges Update?
              |
              +-- JA → 🟡 MITTEL
              |
              +-- NEIN → 🟢 NIEDRIG
```

---

## 📊 Metriken für Priorisierung

### Automatische Updates (Renovate)
- **Base Image Updates**: 🟠 HOCH (Security & Stability)
- **Dev Dependencies**: 🟡 MITTEL
- **Minor Versions**: 🟡 MITTEL
- **Patch Versions**: 🟢 NIEDRIG

### Code Changes
- **Feature mit User Value**: 🟠 HOCH
- **Bug Fixes**: 🟠 HOCH
- **Refactoring**: 🟡 MITTEL
- **Code Style**: 🟢 NIEDRIG

### Documentation
- **Critical Docs**: 🟠 HOCH
- **Process Docs**: 🟡 MITTEL
- **Nice-to-have**: 🟢 NIEDRIG

---

## 💡 Best Practices

### ✅ DO's
- Sei prägnant und fokussiert
- Erkläre das WARUM, nicht das WIE
- Teste alle Komponenten vor dem PR
- Verlinke relevante Issues
- Nutze das PR-Template
- Sei realistisch bei der Priorisierung

### ❌ DON'Ts
- Alles als "KRITISCH" einstufen
- Wilde Scope-Creep (mehrere unabhängige Changes)
- Ungetestete PRs erstellen
- Container-Secrets in Logs/Logs posten
- Vague Descriptions ("fixed stuff")

---

## 🚀 Review-Erwartungen nach Priorität

| Priorität | Review-Ziel | Merge-Ziel | 
|-----------|------------|-----------|
| 🔴 Kritisch | < 2 Stunden | < 4 Stunden |
| 🟠 Hoch | < 1 Tag | < 2 Tage |
| 🟡 Mittel | < 3 Tage | < 1 Woche |
| 🟢 Niedrig | Flexible | Flexible |

---

## 📞 Fragen zur Priorisierung?

- Konsultiere den Entscheidungsbaum oben
- Im Zweifelsfall wähle eine niedrigere Priorität
- Kann immer während des Reviews angepasst werden
