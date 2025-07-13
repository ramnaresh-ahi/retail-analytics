
{{ config(
    materialized='incremental',
    unique_key='interaction_id'
) }}

WITH latest_interactions AS(
    SELECT
        interaction_id,
        customer_id,
        channel,
        interaction_type,
        duration_in_sec,
        page_or_product,
        session_id,
        interaction_date
    FROM
        {{ ref('stg_interactions')}}

    {% if is_incremental() %}
    WHERE 
        interaction_date > (SELECT MAX(interaction_date) FROM {{ this }})
    {% endif %}
    
)

SELECT
    *
FROM
    latest_interactions