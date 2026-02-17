WITH most_sold_products AS (
  SELECT
    o.store_id,
    oi.product_id,
    SUM(oi.order_quantity) AS product_quantity,
    NTILE(3) OVER (
        PARTITION BY store_id
        ORDER BY SUM(oi.order_quantity) DESC
    ) AS sales_bucket
  FROM `dbt_prod_local_bike.int_local_bike__orders` o
  LEFT JOIN `dbt_prod_local_bike.int_local_bike__order_items` oi ON oi.order_id = o.order_id
  GROUP BY 1,2
)

SELECT 
  stores.store_name,
  p.product_name,
  msp.sales_bucket,
  CASE
    WHEN msp.sales_bucket IS NULL THEN 'none'
    WHEN msp.sales_bucket = 1 THEN 'high'
    WHEN msp.sales_bucket = 2 THEN 'medium'
    WHEN msp.sales_bucket = 3 THEN 'low'
  END AS criticite
FROM `dbt_prod_local_bike.int_local_bike__stocks` stocks
LEFT JOIN `dbt_prod_local_bike.stg_local_bike__stores` stores ON stores.store_id = stocks.store_id
LEFT JOIN `dbt_prod_local_bike.int_local_bike__products` p ON p.product_id = stocks.product_id
LEFT JOIN most_sold_products msp ON msp.store_id = stocks.store_id AND msp.product_id = stocks.product_id
WHERE stocks.stock_quantity = 0
ORDER BY stores.store_id, msp.sales_bucket