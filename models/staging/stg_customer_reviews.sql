
WITH customer_reviews AS(
    SELECT
        review_id,
        customer_id,
        product_name,
        product_category,
        full_name as cust_full_name,
        CAST(TIMESTAMP_MICROS(CAST(transaction_date / 1000 as INT64)) as DATE) as transaction_date,
        CAST(TIMESTAMP_MICROS(CAST(review_date / 1000 as INT64)) as DATE) as review_date,
        rating,
        review_title,
        review_text
    FROM
        {{ source('raw', 'customer_reviews')}}
)

SELECT
    *
FROM
    customer_reviews