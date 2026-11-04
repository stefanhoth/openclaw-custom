# PR Summary Template with Prioritization Recommendation

## Quick Reference

| Aspect | Value |
|--------|-------|
| **Priority Level** | [Critical / High / Medium / Low] |
| **Complexity** | [Simple / Moderate / Complex / Very Complex] |
| **Risk Level** | [Low / Medium / High] |
| **Testing Required** | [Minimal / Standard / Extensive / N/A] |
| **Review Time** | [~5 min / ~15 min / ~30+ min] |

---

## 1. Summary

### What Changed
- **Brief description** of the core change
- **Files affected** and scope
- **Impact area** (e.g., infrastructure, deployment, feature, security)

### Why
- **Business justification** or reason for the change
- **Problem being solved**
- **Benefits**

---

## 2. Prioritization Recommendation

### Priority Matrix

```
        Impact
        /    \
    High      Low
    /          \
 Low Risk    Low Risk     = MERGE QUICKLY
 High Value  High Value
    |          |
 High Risk   High Risk     = REVIEW CAREFULLY / DEFER
 High Value  Low Value
```

### Recommended Priority: **[CRITICAL / HIGH / MEDIUM / LOW]**

#### Rationale
- ✅ **Positive factors**: (list reasons to merge soon)
- ⚠️ **Concerns**: (list reasons for caution)
- 🔍 **Considerations**: (other factors)

---

## 3. Risk Assessment

### Risk Level: **[Low / Medium / High]**

| Category | Assessment |
|----------|------------|
| **Code Changes** | Simple dependency update / Complex logic change / etc. |
| **Breaking Changes** | None / Minor / Major |
| **Backward Compatibility** | Fully compatible / Migration path / Incompatible |
| **Testing Coverage** | Not needed / Partially tested / Well tested |
| **Deployment Impact** | No impact / Blue-green deploy / Full restart required |
| **Rollback Difficulty** | Trivial (revert commit) / Simple (migrate data) / Complex |

---

## 4. Technical Details

### Change Summary
```
- Component/File: Change description
- Dependencies: What was updated/added/removed
- Configuration: Any config changes needed
```

### Migration Notes
- [ ] No migration needed
- [ ] Data migration required
- [ ] Config update needed
- [ ] Environment variables to set
- [ ] Database schema changes
- [ ] Other migrations

---

## 5. Testing Recommendations

### Pre-Merge Testing
- [ ] Unit tests passing
- [ ] Integration tests passing
- [ ] E2E tests passing
- [ ] Performance benchmarks (if relevant)
- [ ] Security scanning completed
- [ ] Manual testing in staging

### Post-Merge Validation
- [ ] Monitor logs for errors
- [ ] Check metrics/dashboards
- [ ] Verify external integrations
- [ ] User feedback on changes

### Testing Effort
- **Minimal**: 5-10 minutes, basic smoke test
- **Standard**: 30 minutes, standard test suite
- **Extensive**: 1+ hours, comprehensive testing + performance validation

---

## 6. Review Checklist

### For Reviewers
- [ ] Code follows style guidelines
- [ ] No obvious bugs or logic errors
- [ ] Error handling is appropriate
- [ ] Tests are adequate
- [ ] Documentation is updated
- [ ] Security implications reviewed
- [ ] Performance implications considered

### For Author
- [ ] Commit messages are clear
- [ ] PR description is complete
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No unrelated changes included

---

## 7. Recommendation

### Action: **MERGE / HOLD / REJECT**

**Reasoning**: 
- Explain the decision
- Outline any conditions for merging
- Mention any follow-up items

**Next Steps**:
1. Complete any remaining reviews
2. Address any comments
3. Merge and monitor
4. Post-merge: Track metrics/logs

---

## Real-World Example: actions/checkout v6 → v7

| Aspect | Value |
|--------|-------|
| **Priority Level** | **Medium-High** |
| **Complexity** | **Simple** |
| **Risk Level** | **Low** |
| **Testing Required** | **Minimal** |
| **Review Time** | **~10 min** |

### Summary
Updates GitHub Actions `checkout` from v6 to v7 (major version). Includes security improvements and dependency updates.

### Prioritization Rationale
- ✅ **Security improvement**: Blocks fork PR checkout for sensitive events
- ✅ **Low complexity**: Single file change, configuration only
- ✅ **Backward compatible**: No workflow changes required
- ⚠️ **Major version**: Requires validation
- ✅ **Low blast radius**: Only affects CI/CD pipeline

### Risk Assessment
| Category | Assessment |
|----------|------------|
| **Code Changes** | Configuration only, no application code |
| **Breaking Changes** | None for standard workflows |
| **Backward Compatibility** | Fully compatible |
| **Testing Coverage** | Verify CI pipeline executes |
| **Deployment Impact** | CI/CD pipeline only |
| **Rollback Difficulty** | Trivial (single line revert) |

### Testing Recommendations
1. ✅ Run full CI pipeline on this PR
2. ✅ Verify workflow execution on next deployment
3. ✅ Monitor for any integration issues
4. ✅ No additional testing needed

### Recommendation
**✅ MERGE** after CI passes. Straightforward security update with minimal risk and easy rollback.

---

## Decision Making Framework

### Use HIGH/CRITICAL Priority When:
- 🔴 **Security vulnerabilities** being fixed
- 🔴 **Critical bugs** affecting production
- 🔴 **Performance regressions** being corrected
- 🔴 **Data loss risks** being mitigated
- 🔴 **Compliance/regulatory** requirements

### Use MEDIUM Priority When:
- 🟡 **Dependencies** being updated
- 🟡 **Minor features** being added
- 🟡 **Code quality** being improved
- 🟡 **Tech debt** being reduced
- 🟡 **Low-impact bugs** being fixed

### Use LOW Priority When:
- 🟢 **Documentation** changes only
- 🟢 **Formatting/style** improvements
- 🟢 **Comments/comments** being added
- 🟢 **Non-critical** test additions
- 🟢 **Cleanup** without behavioral changes

---

**Template Version**: 1.0  
**Last Updated**: 2026-06-25  
**Author**: Claude Code
