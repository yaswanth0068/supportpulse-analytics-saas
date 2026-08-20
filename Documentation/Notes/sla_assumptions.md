# SLA Target Assumptions

The raw dataset does not include an explicit SLA target or breach column.
The following resolution-time matrix (in hours) was defined to operationalize
SLA compliance analysis, based on typical tiered SaaS support models:

| Priority | Standard | Gold | Platinum |
|----------|----------|------|----------|
| Urgent   | 8        | 4    | 2        |
| High     | 24       | 12   | 6        |
| Medium   | 48       | 24   | 12       |
| Low      | 72       | 48   | 24       |

`sla_breached` is only defined for tickets in a terminal state
(`resolved` or `closed_no_action`) — open/in-progress tickets have no
resolution time yet, so breach status is NaN, not False.