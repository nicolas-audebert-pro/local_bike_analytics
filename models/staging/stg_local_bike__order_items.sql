SELECT
    order_id,
    CONCAT(order_id,'-',item_id) as order_items_id,
    product_id,
    COALESCE(quantity,0) as quantity,
    COALESCE(list_price,0) as unit_price,
    COALESCE(discount,0) as discount,
    round(list_price * quantity * (1 - discount),2) as total_order_item_amount
FROM {{ source("local_bike","order_items")}}