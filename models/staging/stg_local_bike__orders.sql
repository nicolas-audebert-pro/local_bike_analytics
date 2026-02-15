SELECT
    order_id,
    customer_id,
    order_status,
    CAST(order_date as date) as order_date,
    CAST(required_date as date) as required_date,
    SAFE_CAST(NULLIF(shipped_date, 'NULL') as date) as shipped_date,
    store_id,
    staff_id
FROM {{source("local_bike","orders")}}