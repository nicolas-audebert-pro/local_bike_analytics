WITH most_sold_products AS (
  SELECT
    o.store_id,
    oi.product_id,
    SUM(oi.order_quantity) AS product_quantity,
    NTILE(3) OVER (
        PARTITION BY store_id
        ORDER BY SUM(oi.order_quantity) DESC
    ) AS sales_bucket
  FROM {{ref("int_local_bike__orders")}} o
  LEFT JOIN {{ref("int_local_bike__order_items")}} oi ON oi.order_id = o.order_id
  GROUP BY 1,2
)

SELECT 
  s.store_name,
  s.product_name,
  CASE
    WHEN msp.sales_bucket IS NULL THEN 'none'
    WHEN msp.sales_bucket = 1 THEN 'high'
    WHEN msp.sales_bucket = 2 THEN 'medium'
    WHEN msp.sales_bucket = 3 THEN 'low'
  END AS criticity
FROM {{ref("dim_local_bike__stocks")}} s
LEFT JOIN most_sold_products msp ON msp.store_id = s.store_id AND msp.product_id = s.product_id
WHERE s.stock_quantity = 0
ORDER BY s.store_id, msp.sales_bucket