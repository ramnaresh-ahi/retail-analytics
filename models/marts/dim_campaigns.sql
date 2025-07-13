
WITH campaigns AS(
    SELECT
        *
    FROM
        {{ ref('stg_campaigns')}}
)

SELECT
    campaign_id,
    campaign_name,
    campaign_type,
    start_date,
    end_date,
    target_segment,
    budget,
    impressions,
    clicks,
    conversions,
    conversion_rate,
    roi 
FROM
    campaigns