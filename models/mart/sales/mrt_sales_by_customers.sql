SELECT
  o.customer_full_name,
  count(o.order_id) as total_orders,
  cast(sum(o.order_total_amount) as numeric) as total_orders_amount,
  cast(avg(o.order_total_amount) as numeric) as avg_orders_amount,
  cast(sum(oi.order_quantity) as integer) as total_orders_quantity
FROM {{ref("dim_local_bike__orders")}} o
LEFT JOIN {{ref("int_local_bike__order_items")}} oi ON oi.order_id = o.order_id
GROUP BY customer_full_name
ORDER BY total_orders DESC