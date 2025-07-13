
{{
    config(
        materialized = 'incremental',
        unique_key = 'ticket_id'
    )
}}

WITH latest_support_tickets AS(
    SELECT
        ticket_id,
        customer_id,
        issue_category,
        priority,
        submission_date,
        resolution_status,
        resolution_date,
        customer_satisfaction_score,
        notes
    FROM
        {{ ref('stg_support_tickets')}}
    
    {% if is_incremental() %}
    WHERE 
        submission_date > (SELECT MAX(submission_date) FROM {{ this }}
    {% endif %}
)

SELECT
    *
FROM
    latest_support_tickets