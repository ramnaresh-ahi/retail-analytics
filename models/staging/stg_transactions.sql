
WITH transactions AS(
    SELECT
        transaction_id,
        customer_id,
        product_name,
        product_category,
        CAST(quantity as INTEGER) as quantity,
        price,
        transaction_date,
        store_location,
        payment_method,
        CAST(discount_applied as INTEGER) as discount_applied
    FROM
        {{ source('raw', 'transactions')}}

)

SELECT
    *
FROM
    transactions