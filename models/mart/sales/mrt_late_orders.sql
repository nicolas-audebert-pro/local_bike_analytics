WITH late_orders AS (
SELECT
  order_year,
  order_month,
  count(order_id) as total_late_order,
FROM {{ref("dim_local_bike__orders")}}
WHERE order_is_late = 1
GROUP BY 1, 2
),

total_orders AS (
SELECT
  order_year,
  order_month,
  count(order_id) as total_order,
FROM {{ref("dim_local_bike__orders")}}
GROUP BY 1, 2
)

SELECT DISTINCT
  o.order_year,
  o.order_month,
  COALESCE(total_late_order,0) as total_late_order,
  COALESCE(total_order,0) as total_order,
  COALESCE(COALESCE(total_late_order,0) / COALESCE(total_order,0),0) as rate_late_order,
FROM {{ref("dim_local_bike__orders")}} o
LEFT JOIN late_orders l ON l.order_year = o.order_year AND l.order_month = o.order_month
LEFT JOIN total_orders t ON t.order_year = o.order_year AND t.order_month = o.order_month
ORDER BY order_year DESC, order_month DESC