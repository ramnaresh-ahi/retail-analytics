
WITH interactions AS(
    SELECT
        interaction_id,
        customer_id,
        COALESCE(channel , 'Unknown') as channel,
        COALESCE(interaction_type , 'Unknown') as interaction_type,
        interaction_date,
        CAST(duration as INTEGER) as duration_in_sec,
        COALESCE(page_or_product , 'Unknown') as page_or_product,
        session_id
    FROM
        {{ source('raw', 'interactions')}}
)

SELECT
    *
FROM
    interactions