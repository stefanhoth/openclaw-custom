# 🎯 PR Summary Template mit Priorisierungsempfehlung

Dieses Template zeigt die Best-Practice Struktur für PR-Beschreibungen im openclaw-custom Projekt mit Priorisierungsempfehlungen.

---

## 📋 Zusammenfassung (Summary)

*[Kurze Beschreibung: Was wird gemacht und warum? 2-3 Sätze]*

---

## 🎯 Zweck und Nutzen (Purpose & Value)

**Problem gelöst:**
- *[Aufzählung der Probleme/Pain Points]*

**Lösung:**
- ✅ *[Konkrete Lösungsansätze]*
- ✅ *[Implementation Details]*
- ✅ *[Besonderheiten]*

**Geschäftlicher Wert:**
- *[ROI/Business Impact]*
- *[Effizienzgewinne]*
- *[Qualitätsverbesserungen]*

---

## 📊 Priorisierungsempfehlung (Prioritization Guidance)

### Prioritätsebenen und Kriterien:

#### 🔴 **KRITISCH (Critical)**
- 🚨 Blockiert andere Features oder Production Issues
- ⚠️ Security/Compliance Vulnerabilities
- 🔥 Service/System Down
- ⏰ Hard Deadline (< 24h)

**Aktion:** Sofort implementieren, expedited Review

---

#### 🟠 **HOCH (High)**
- 📈 Direkt kundenorientiert / Geschäftswert
- 🔗 Abhängigkeiten für andere PRs
- ⚡ Performance/UX Verbesserung
- 📅 Deadline diese Woche
- 🛡️ Security Hardening (nicht kritisch)

**Aktion:** Diese Woche durchführen, Standard Review

---

#### 🟡 **MITTEL (Medium)**
- 📚 Prozessverbesserungen
- 🏗️ Technical Debt Reduction
- 🔧 Wartbarkeit/Testing Verbesserungen
- 📅 Keine straffe Deadline
- 👥 Team-Alignment nötig

**Aktion:** Nächste 2-3 Wochen, Standard Review

---

#### 🟢 **NIEDRIG (Low)**
- 📖 Dokumentation nur
- 💅 Code Style/Formatting (non-functional)
- 🧹 Cleanup (keine Code-Logik)
- 🎨 Nice-to-Have Features
- 🔮 Future Preparation

**Aktion:** Back-of-queue, kann kombiniert werden

---

### 📋 Bewertungs-Matrix für deine PR:

| Kriterium | Bewertung | Score | Details |
|-----------|-----------|-------|---------|
| **Impact** | 🟢/🟡/🔴 | [High/Medium/Low] | Wer ist betroffen? |
| **Dringlichkeit** | 🟢/🟡/🔴 | [High/Medium/Low] | Zeitliche Zwänge? |
| **Komplexität** | 🟢/🟡/🔴 | [Low/Medium/High] | Code-Änderungen extensive? |
| **Risiko** | 🟢/🟡/🔴 | [Low/Medium/High] | Breaking Changes? |
| **Dependencies** | 🟢/🟡/🔴 | [None/Some/Heavy] | Blockiert/wird blockiert? |

**Gesamtpriorität berechnen:**
- **3+ Rot:** KRITISCH
- **2 Rot oder 3+ Orange:** HOCH
- **1 Rot oder 2+ Orange:** MITTEL
- **Rest:** NIEDRIG

---

## 🔄 Änderungen (Changes)

- *[Liste der Dateiänderungen/Features]*
- *[Neue Dateien]*
- *[Gelöschte/Veraltete Komponenten]*

---

## ✅ Test Plan

- [ ] Lokale Tests durchgeführt
- [ ] Manuelles Testing (falls UI)
- [ ] Edge Cases getestet
- [ ] CI/CD grün
- [ ] Code Review durchgeführt
- [ ] Breaking Changes dokumentiert

---

## 🔒 Sicherheit & Compliance

- [ ] Keine credentials/secrets committed
- [ ] Keine Abhängigkeits-Vulnerabilities
- [ ] OWASP Top 10 Richtlinien befolgt
- [ ] Input Validation implementiert

---

## 📝 Hinweise & Kontext

- *[Wichtige Kontextinformationen]*
- *[Team-Abhängigkeiten]*
- *[Bekannte Limitationen]*
- *[Follow-up Issues]*

---

## 👥 Reviewers

- **Code Review:** @[maintainer]
- **Security Review:** @[security-owner] (wenn relevant)
- **Product Review:** @[product-owner] (wenn Business Impact)

---

## 📚 Ressourcen

- [Related Issue](#)
- [Design Doc](#)
- [Architecture Decision Record](#)

---

## 📊 Beispiel einer HOHEN Priorität PR:

```markdown
## 📋 Zusammenfassung

Behebt kritisches Memory Leak in OpenClaw Gateway, das zu 100% CPU und Service Crashes führt.
Einfacher Fix mit hohem Impact.

## 🎯 Zweck und Nutzen

**Problem:** Memory wächst kontinuierlich, Service crasht nach ~4 Stunden.
**Lösung:** Schließe open streams in cleanup-Handler
**Wert:** Stoppt aktuelle Production Incidents

## 📊 Priorisierung: 🔴 KRITISCH

| Kriterium | Score |
|-----------|-------|
| Impact | 🔴 Production Down |
| Dringlichkeit | 🔴 Active Incident |
| Komplexität | 🟢 Low (3-Zeilen Fix) |
| Risiko | 🟢 Minimal |
| Dependencies | 🟢 None |

✅ Expedited Review Request  
⏰ Ziel: Merged in 1h
```

---

**Letztes Update:** 2026-06-05  
**Autor:** OpenClaw Development Team
