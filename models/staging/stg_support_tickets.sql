
WITH support_tickets AS(
    SELECT
        ticket_id,
        customer_id,
        COALESCE(issue_category, 'Unknown') as issue_category,
        priority,
        submission_date,
        resolution_date,
        resolution_status,
        CAST(resolution_time_hours as INTEGER) as resolution_time_hours,
        CAST(customer_satisfaction_score as INTEGER) as customer_satisfaction_score,
        notes
    FROM
        {{ source('raw', 'support_tickets')}}
)

SELECT
    *
FROM
    support_tickets