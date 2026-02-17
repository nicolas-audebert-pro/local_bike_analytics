SELECT
  c.customer_state,
  count(distinct c.customer_id) as total_customers,
  count(o.order_id) as total_orders,
  sum(o.order_total_amount) as total_amount,
  sum(oi.order_quantity) as total_quantity
FROM {{ref("int_local_bike__customers")}} c
LEFT JOIN {{ref("dim_local_bike__orders")}} o ON o.customer_id = c.customer_id
LEFT JOIN {{ref("dim_local_bike__order_items")}} oi ON oi.order_id = o.order_id
GROUP BY 1