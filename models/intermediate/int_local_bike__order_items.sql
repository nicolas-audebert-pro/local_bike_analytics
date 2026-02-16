SELECT
    order_items_id,
    order_id,
    product_id,
    order_quantity,
    unit_price,
    discount,
    order_quantity * unit_price * (1-discount) as order_item_total_amount
FROM {{ ref("stg_local_bike__order_items")}}