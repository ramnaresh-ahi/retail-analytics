
{{ config(
    materialized = 'incremental',
    unique_key = 'review_id'
)}}

WITH latest_customer_reviews AS(
    SELECT
        review_id,
        customer_id,
        product_name,
        product_category,
        cust_full_name,
        transaction_date,
        review_date,
        rating,
        review_title,
        review_text
    FROM
        {{ ref('stg_customer_reviews')}}
    
    {% if is_incremental() %}
    WHERE
        review_date > (SELECT MAX(review_date) FROM {{this}})
    {% endif%}
)

SELECT
    *
FROM
    latest_customer_reviews