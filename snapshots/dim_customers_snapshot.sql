
{% snapshot customers_snapshot %}

{{
    config(
        target_schema='snapshots',       
        unique_key='customer_id',
        strategy='check',               
        check_cols=['full_name', 'email', 'phone', 'street_address', 'city' 'state', 'zip_code', 'preferred_channel'], 
        invalidate_hard_deletes=True    
    )
}}

SELECT
    * 
FROM 
    {{ ref('stg_customers') }}

{% endsnapshot %}
