
WITH campaigns AS(
    SELECT
        campaign_id,
        campaign_name,
        COALESCE(campaign_type , 'Unknown') as campaign_type,
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
        {{ source('raw', 'campaigns')}}
    
)

SELECT
    *
FROM
    campaigns