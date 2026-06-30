# PR Summary Template mit Priorisierungsempfehlung

## 📋 Übersicht
**Titel:** [Kurze, prägnante Beschreibung der Änderung]

**Branch:** `claude/dreamy-ramanujan-xuefss`

**Autor:** [@stefanhoth](https://github.com/stefanhoth)

---

## 🎯 Priorisierungsmatrix

| Kategorie | Bewertung | Begründung |
|-----------|-----------|-----------|
| **Impact** | 🔴 Hoch / 🟡 Mittel / 🟢 Niedrig | Wie viele Nutzer/Features sind betroffen? |
| **Urgency** | 🔴 Kritisch / 🟡 Wichtig / 🟢 Normal | Wie zeitnah muss das gemerged werden? |
| **Complexity** | 🔴 Hoch / 🟡 Mittel / 🟢 Niedrig | Wie komplex sind die Änderungen? |
| **Risk** | 🔴 Hoch / 🟡 Mittel / 🟢 Niedrig | Besteht Risiko für Regressions? |

**Empfohlene Priorität:** `P0 / P1 / P2 / P3`

---

## 📝 Änderungsbeschreibung

### Was wurde geändert?
- Punkt 1
- Punkt 2
- Punkt 3

### Warum diese Änderung?
[Hintergrund, Kontext, Problem das gelöst wird]

### Wie funktioniert die Lösung?
[Technische Erklärung der Implementierung]

---

## 🧪 Testabdeckung

- [ ] Unit Tests hinzugefügt/updated
- [ ] Integration Tests durchgeführt
- [ ] Manuelles Testing durchgeführt
- [ ] Edge Cases getestet

### Test Plan
1. [Test 1]
2. [Test 2]
3. [Test 3]

---

## ⚠️ Potenzielle Risiken

- **Risiko 1:** [Beschreibung] → Mitigation: [Wie wird damit umgegangen]
- **Risiko 2:** [Beschreibung] → Mitigation: [Wie wird damit umgegangen]

---

## 📊 Metriken (falls relevant)

| Metrik | Vorher | Nachher | Verbesserung |
|--------|--------|---------|--------------|
| Performance | - | - | - |
| Bundle Size | - | - | - |
| Test Coverage | - | - | - |

---

## 🔄 Abhängigkeiten & Blocking Issues

- [ ] Abhängig von PR #XXX
- [ ] Blockiert durch Issue #XXX
- [ ] Keine bekannten Abhängigkeiten

---

## ✅ Review Checklist

- [ ] Code-Style konsistent mit Projekt-Standards
- [ ] Keine hardcodierten Werte
- [ ] Kommentare wo nötig hinzugefügt
- [ ] Keine Debug-Statements im Code
- [ ] Documentation aktualisiert
- [ ] Breaking Changes dokumentiert (falls vorhanden)

---

## 🚀 Deployment Hinweise

- **Deployment-Strategie:** [Blue/Green, Canary, etc.]
- **Rollback Plan:** [Falls nötig]
- **Monitoring:** [Was sollte überwacht werden?]

---

## 📌 Prioritätsempfehlung Erklärung

### Scoring System

**Impact Score (0-10):**
- 10: Kritische Systemfunktionalität, viele Nutzer betroffen
- 7-9: Kernfeature, mehrere Teams betroffen
- 4-6: Seitenfeature, einzelne Teams betroffen
- 1-3: Kleine Optimierung oder Dokumentation

**Urgency Score (0-10):**
- 10: Produktionsausfall, Security-Lücke
- 7-9: Bug betrifft aktive Nutzer, wichtiger für Release
- 4-6: Geplante Verbesserung mit Deadline
- 1-3: Technische Schulden, optional

**Complexity Score (0-10):**
- 10: Komplexe Refactoring, mehrere Systeme betroffen
- 7-9: Mittlere Komplexität, neue Patterns
- 4-6: Standard-Änderungen
- 1-3: Kleine Fixes, klar umrissen

**Risk Score (0-10):**
- 10: Hohe Regressions-Wahrscheinlichkeit
- 7-9: Könnte existierende Features beeinflussen
- 4-6: Minimales, kalkulierbares Risiko
- 1-3: Sehr sicherer Change

### Prioritätsklassen

| Klasse | Impact | Urgency | Complexity | Risk | Merging |
|--------|--------|---------|-----------|------|---------|
| **P0 - Critical** | 9-10 | 9-10 | - | - | ASAP |
| **P1 - High** | 7-10 | 7-10 | - | - | Diese Woche |
| **P2 - Medium** | 4-8 | 3-8 | - | - | Nächste Woche |
| **P3 - Low** | 1-6 | 1-6 | - | - | Optional |

---

## 💬 Reviewer Notes

[Spezifische Bereiche auf die Reviewer achten sollten]

---

## 📚 Links & Ressourcen

- [Issue #XXX](link)
- [Design Doc](link)
- [Related PR #XXX](link)

---

**Letzte Aktualisierung:** [Datum]
