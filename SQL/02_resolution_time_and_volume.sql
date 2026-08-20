-- Does platinum actually take LONGER in absolute hours, or just breach more due to tighter targets?
SELECT
    sla_plan,
    priority,
    ROUND(AVG(resolution_time_hours), 1) AS avg_resolution_hours,
    ROUND(AVG(sla_target_hours), 1) AS avg_target_hours,
    COUNT(*) AS n
FROM tickets
WHERE is_terminal = 1
GROUP BY sla_plan, priority
ORDER BY sla_plan, priority;

-- Month-over-month ticket volume with rolling trend (window function)
WITH monthly_volume AS (
    SELECT
        created_month,
        COUNT(*) AS ticket_count
    FROM tickets
    GROUP BY created_month
)
SELECT
    created_month,
    ticket_count,
    ROUND(AVG(ticket_count) OVER (
        ORDER BY created_month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 0) AS rolling_3mo_avg,
    ticket_count - LAG(ticket_count) OVER (ORDER BY created_month) AS mom_change
FROM monthly_volume
ORDER BY created_month;