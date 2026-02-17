SELECT
  store_name,
  count(order_id) as total_in_progress_order
FROM {{ref("dim_local_bike__orders")}}
WHERE order_status <> 4
GROUP BY 1;