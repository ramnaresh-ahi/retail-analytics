
WITH interactions AS(
    SELECT
        interaction_id,
        customer_id,
        channel,
        interaction_type,
        interaction_date,
        CAST(duration as INTEGER) as duration_in_sec,
        page_or_product,
        session_id
    FROM
        {{ source('raw', 'interactions')}}
)

SELECT
    *
FROM
    interactions