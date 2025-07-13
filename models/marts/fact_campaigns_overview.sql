
WITH campaigns_overview AS(
    SELECT
        campaign_type,
        allocated_total_budget,
        total_impressions,
        total_clicks,
        total_conversions,
        avg_conversion_rate_in_percentage,
        total_roi
    FROM
        {{ ref('int_campaigning_overview')}}
)

SELECT
    *
FROM
    campaigns_overview