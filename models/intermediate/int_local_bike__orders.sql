WITH total_amount as (
    SELECT
        order_id,
        cast(sum(order_quantity * unit_price * (1-discount)) as numeric) as sum_amount
    FROM {{ref("stg_local_bike__order_items")}}
    GROUP BY order_id
)

SELECT
    o.order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    shipped_date,
    cast(CASE WHEN shipped_date IS NOT NULL AND shipped_date > required_date THEN 1 ELSE 0 END as int64) AS order_is_late,
    store_id,
    staff_id,
    sum_amount as order_total_amount
FROM {{ref("stg_local_bike__orders")}} o
JOIN total_amount ta ON ta.order_id = o.order_id