SELECT
    CONCAT(store_id,'-',product_id) as stock_id,
    CAST(store_id as INT64) AS store_id,
    CAST(product_id as INT64) AS product_id,
    CAST(quantity as INT64) AS stock_quantity
FROM {{source("local_bike","stocks")}}