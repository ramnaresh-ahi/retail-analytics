
WITH campaigning AS(
    SELECT
        campaign_type,
        ROUND(SUM(budget), 2) as allocated_total_budget,
        CAST(SUM(impressions) as INTEGER) as total_impressions,
        CAST(SUM(clicks) as INTEGER) as total_clicks,
        CAST(SUM(conversions) as INTEGER) as total_conversions,
        ROUND(AVG(conversion_rate), 2) as avg_conversion_rate_in_percentage,
        ROUND(SUM(roi), 2) as total_roi 
    FROM
        {{ ref('stg_campaigns')}}
    GROUP BY
        campaign_type
        
)

SELECT
    *
FROM
    campaigning
ORDER BY
    total_roi DESC