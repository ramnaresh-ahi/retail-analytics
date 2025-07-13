
WITH transactions AS(
    SELECT
        transaction_id,
        customer_id,
        product_name,
        product_category,
        quantity,
        ROUND(price, 2) as price,
        discount_applied,
        ROUND(((price - (price*(discount_applied/100)))*quantity), 2) as total_amount,
        payment_method,
        store_location,
        transaction_date
    FROM
        {{ ref('stg_transactions')}}
    WHERE
        quantity IS NOT NULL
        AND 
        price IS NOT NULL
        AND 
        discount_applied IS NOT NULL

)

SELECT
    *
FROM
    transactions
ORDER BY
    total_amount DESC