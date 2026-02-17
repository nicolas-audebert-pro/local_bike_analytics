SELECT
    stock_id,
    sk.store_id,
    store_name,
    sk.product_id,
    product_name,
    stock_quantity,
    stock_value
FROM {{ref("int_local_bike__stocks")}} sk
LEFT JOIN {{ref("int_local_bike__products")}} p ON p.product_id = sk.product_id
LEFT JOIN {{ref("int_local_bike__stores")}} ss ON ss.store_id = sk.store_id