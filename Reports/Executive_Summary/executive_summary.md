# SupportPulse: SLA Compliance & Breach Risk Analysis
## Executive Summary

**Prepared for:** DeskPulse Cloud Solutions Support Leadership
**Analysis period:** January 2022 – December 2025 | 100,000 tickets analyzed

---

### The Problem

DeskPulse has no visibility into where its support SLA commitments are failing, or whether breach risk can be anticipated and prevented.

### The Finding: The "Platinum Paradox"

Platinum-tier customers — who pay for the fastest guaranteed support — experience the **highest SLA breach rates in the company (up to 85.5%)**, more than 5x the standard tier's 13.1%.

This is not a service-quality failure. Average actual resolution time is nearly identical across all three plan tiers at every priority level (e.g., urgent tickets resolve in ~24–27 hours regardless of plan). The team is **not** treating premium customers worse — the **platinum SLA targets themselves are set 2–4x tighter than what the team can realistically deliver.**

**Recommendation:** Renegotiate platinum SLA targets to reflect actual operational capacity, or invest specifically in faster platinum-ticket routing if the 2–6 hour targets are a hard commercial commitment.

### Secondary Findings

- Channel, customer segment, product area, and customer sentiment have **no meaningful effect** on breach likelihood (all within 1–2 percentage points of baseline) — priority × plan tier is essentially the only real driver.
- Ticket volume is **flat** (~2,000–2,200/month, 4 years running) — this is not a growth or staffing problem.
- Customer sentiment reflects the *nature of the issue at intake*, not the outcome of resolution — it should not be used as an SLA risk signal.

### Predictive Model

A Random Forest classifier flags at-risk tickets at creation time with **77.5% ROC-AUC** and catches **73% of true breaches**, enabling proactive escalation before SLA deadlines are missed. Model confirms the finding above quantitatively: plan tier and target hours alone explain ~76% of breach risk.

### Bottom Line

DeskPulse's SLA problem is a **target design issue**, not a staffing, service-quality, or customer-segment issue. Fixing the platinum SLA matrix — rather than hiring more agents or investigating "problem" channels/segments — is the highest-leverage next step.