SELECT
    stock_id,
    store_id,
    s.product_id,
    stock_quantity,
    cast(stock_quantity * p.product_unit_price as numeric) as stock_value
FROM {{ref("stg_local_bike__stocks")}} s
LEFT JOIN {{ref("stg_local_bike__products")}} p ON p.product_id = s.product_id