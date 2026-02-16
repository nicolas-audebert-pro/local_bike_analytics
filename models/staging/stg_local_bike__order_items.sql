SELECT
    CONCAT(order_id,'-',item_id) as order_items_id,
    cast(order_id as int64) as order_id,
    cast(product_id as int64) as product_id,
    cast(COALESCE(quantity,0) as int64) as order_quantity,
    cast(COALESCE(list_price,0) as numeric) as unit_price,
    cast(COALESCE(discount,0) as numeric) as discount
FROM {{ source("local_bike","order_items")}}