# SupportPulse — SaaS Helpdesk SLA & Agent Performance Analytics

**Repository Name:** `helpdesk-sla-analytics-saas`

## Fictional Company

**DeskPulse Cloud Solutions** is a fictional mid-sized B2B SaaS company whose customer support organization is under increasing pressure from rising ticket volumes and growing SLA breaches. Limited visibility into support operations is leading to delayed resolutions, declining customer satisfaction, and increased customer churn.

## Problem Statement

DeskPulse Cloud Solutions handles thousands of customer support tickets each month, but leadership lacks clear visibility into:

- Where and why SLA breaches occur
- Which agents, categories, or channels contribute to slow resolutions
- How customer sentiment relates to satisfaction and escalations
- Which tickets are likely to miss their SLA before deadlines are exceeded

This project analyzes ticket-level support data to uncover SLA compliance trends, evaluate agent performance, identify customer satisfaction drivers, and build a machine learning model that predicts SLA breach risk at ticket creation, enabling proactive ticket prioritization and intervention.

## Business Questions

This project aims to answer the following business questions:

1. What percentage of support tickets breach SLA, and which combinations of priority, category, and support channel contribute most to these breaches?

2. How does agent workload influence ticket resolution time and customer satisfaction?

3. Can customer sentiment, derived from ticket text, predict dissatisfaction or ticket escalation?

4. Can SLA breach risk be predicted at the time a ticket is created, allowing support teams to proactively triage high-risk tickets?

## Revised Business Questions

1. What SLA breach patterns exist by priority, plan tier, and product area?

2. Does customer sentiment predict dissatisfaction or SLA breach?

3. Can we predict SLA-breach risk at ticket-creation time (classification model)?

4. What do ticket volume trends look like over time (month, day-of-week, hour)?