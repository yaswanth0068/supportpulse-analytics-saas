-- Overall SLA breach rate by priority and plan tier
WITH terminal_tickets AS (
    SELECT *
    FROM tickets
    WHERE is_terminal = 1
)
SELECT
    priority,
    sla_plan,
    COUNT(*) AS total_tickets,
    SUM(sla_breached) AS breached_tickets,
    ROUND(100.0 * SUM(sla_breached) / COUNT(*), 1) AS breach_rate_pct
FROM terminal_tickets
GROUP BY priority, sla_plan
ORDER BY breach_rate_pct DESC;

-- Breach rate by product area, ranked
WITH area_breach AS (
    SELECT
        product_area,
        COUNT(*) AS total_tickets,
        SUM(sla_breached) AS breached_tickets,
        ROUND(100.0 * SUM(sla_breached) / COUNT(*), 1) AS breach_rate_pct
    FROM tickets
    WHERE is_terminal = 1
    GROUP BY product_area
)
SELECT
    *,
    RANK() OVER (ORDER BY breach_rate_pct DESC) AS breach_rank
FROM area_breach;