
{{ config(
    materialized = 'incremental',
    unique_key = 'transaction_id'
)}}

WITH latest_transactions AS(
    SELECT
        transaction_id,
        customer_id,
        product_name,
        product_category,
        quantity,
        price,
        discount_applied,
        total_amount,
        payment_method,
        store_location,
        transaction_date
    FROM
        {{ ref('int_transactions')}}
    
    {% if is_incremental() %}
    WHERE
        transaction_date > (SELECT MAX(transaction_date) FROM {{ this }})
    {% endif %}

)

SELECT
    *
FROM
    latest_transactions