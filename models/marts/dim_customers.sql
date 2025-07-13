 
WITH latest_customers AS (
    SELECT 
        *
    FROM 
        {{ ref('customers_snapshot') }}
    WHERE 
        dbt_valid_to IS NULL
)

SELECT
    customer_id,
    full_name,
    age,
    gender,
    email,
    phone,
    street_address,
    city,
    state,
    zip_code,
    preferred_channel,
    registration_date
FROM 
    latest_customers
