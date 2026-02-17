SELECT
    order_id,
    o.customer_id,
    customer_full_name,
    order_status,
    order_date,
    EXTRACT(DAY FROM order_date) AS order_day,
    EXTRACT(WEEK FROM order_date) AS order_week,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(QUARTER FROM order_date) AS order_quarter,
    EXTRACT(YEAR FROM order_date) AS order_year,
    required_date,
    shipped_date,
    order_is_late,
    o.store_id,
    store_name,
    o.staff_id,
    staff_full_name,
    order_total_amount
FROM {{ref("int_local_bike__orders")}} o
LEFT JOIN {{ref("int_local_bike__customers")}} c on c.customer_id = o.customer_id
LEFT JOIN {{ref("stg_local_bike__stores")}} so on so.store_id = o.store_id
LEFT JOIN {{ref("int_local_bike__staffs")}} sa on sa.staff_id = o.staff_id