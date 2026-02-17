SELECT
    order_items_id,
    order_id,
    oi.product_id,
    product_name,
    order_quantity,
    unit_price,
    discount,
    order_item_total_amount
FROM {{ref("int_local_bike__order_items")}} oi
LEFT JOIN {{ref("int_local_bike__products")}} p ON p.product_id = oi.product_id