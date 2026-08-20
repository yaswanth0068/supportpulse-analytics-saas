# SupportPulse: SaaS Helpdesk SLA & Breach Risk Analytics
## Final Report

## 1. Business Context
DeskPulse Cloud Solutions is a mid-size B2B SaaS company. Support leadership lacks visibility into SLA compliance patterns, drivers of breach risk, and whether sentiment or other signals can predict dissatisfaction or breach before it happens.

## 2. Business Questions
1. What SLA breach patterns exist by priority, plan tier, and product area?
2. Does customer sentiment predict dissatisfaction or SLA breach?
3. Can SLA-breach risk be predicted at ticket-creation time?
4. What do ticket volume trends look like over time?

## 3. Data
**Source:** Synthetic IT Support Tickets, Kaggle (100,000 rows, 2022–2025)
**Fields used:** ticket metadata (priority, plan, channel, product area, segment), timestamps, resolution time, sentiment, CSAT, reopen status.

### 3.1 Data Cleaning Decisions
- `resolution_time_hours` and `resolution_summary` are null for exactly the 39,887 non-terminal tickets (in_progress/on_hold/open) — this is structural, not missing data, and was left as NaN rather than imputed.
- `region` was ~20% null with no structural pattern — filled as "Unknown."
- **No SLA target/breach column existed in the raw data.** A custom target matrix (priority × plan tier, in hours) was defined and documented (`Documentation/Notes/sla_assumptions.md`) to operationalize breach analysis.
- `sla_breached` is defined only for terminal tickets (resolved/closed_no_action) — NaN elsewhere, since resolution time doesn't exist yet for open tickets.

## 4. Methodology
- **SQL** (SQLite): CTEs and window functions for breach-rate aggregation, ranking, and month-over-month trend analysis.
- **Python EDA**: Visualized breach-rate heatmaps, the actual-vs-target resolution gap, and channel/segment/sentiment comparisons.
- **Modeling**: Logistic Regression baseline, Random Forest (unweighted and class-weight-balanced) compared on ROC-AUC and breach-class recall. Balanced Random Forest selected — missing a breach is operationally costlier than a false alarm, so recall was prioritized over raw accuracy.

## 5. Findings
*(Same five findings as the Executive Summary, expanded with supporting SQL/model numbers — breach rate table by priority×plan, resolution-time comparison table, feature importance table.)*

## 6. Model Performance

| Model | ROC-AUC | Breach Recall | Breach Precision |
|---|---|---|---|
| Logistic Regression | 0.756 | 0.57 | 0.61 |
| Random Forest (unweighted) | 0.776 | 0.59 | 0.66 |
| **Random Forest (balanced) — selected** | 0.775 | **0.73** | 0.61 |

**Top features:** `sla_plan` (54.5%), `sla_target_hours` (21.8%), `priority` (4.8%) — together explaining ~81% of predictive power. Sentiment, channel, segment, and region each contribute <2%.

## 7. Limitations
- No `agent_id`/`agent_name` field exists in the dataset — agent-level workload and performance analysis was out of scope for this project.
- SLA targets are an analyst-defined assumption (documented), not sourced from an actual contract — a production deployment would need to validate against DeskPulse's real SLA terms.
- Sentiment field reflects ticket text at intake; it was not tested as a time-series/evolving signal across ticket replies.

## 8. Recommendations
1. Renegotiate or redesign platinum SLA targets to match measured operational capacity.
2. Deploy the breach-risk model at ticket intake to flag high-probability-of-breach tickets (>0.5) for proactive routing.
3. Deprioritize channel/segment-based interventions — the data shows they aren't meaningful breach drivers.