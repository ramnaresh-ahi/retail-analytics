
WITH customers AS(
    SELECT
        customer_id,
        full_name,
        CAST(age as INTEGER) as age,
        gender,
        email,
        phone,
        street_address,
        city,
        state,
        zip_code,
        registration_date,
        CASE
            WHEN preferred_channel IS NULL THEN 'Unknown'
            ELSE preferred_channel
            END as preferred_channel
    FROM
        {{ source('raw', 'customers')}}
)

SELECT
    *
FROM
    customers