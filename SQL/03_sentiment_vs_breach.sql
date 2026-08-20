-- Does sentiment differ meaningfully between breached and non-breached tickets?
SELECT
    sla_breached,
    ROUND(AVG(sentiment_score), 2) AS avg_sentiment_score,
    ROUND(AVG(csat_score), 2) AS avg_csat_score,
    ROUND(100.0 * SUM(reopened) / COUNT(*), 1) AS reopen_rate_pct,
    COUNT(*) AS n
FROM tickets
WHERE is_terminal = 1
GROUP BY sla_breached;

-- Sentiment distribution split by breach status
SELECT
    sla_breached,
    customer_sentiment,
    COUNT(*) AS n,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY sla_breached), 1) AS pct_within_group
FROM tickets
WHERE is_terminal = 1
GROUP BY sla_breached, customer_sentiment
ORDER BY sla_breached, n DESC;