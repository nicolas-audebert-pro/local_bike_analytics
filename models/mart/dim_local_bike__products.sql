SELECT
    product_id,
    product_name,
    p.brand_id,
    brand_name,
    category_id,
    model_year,
    product_unit_price
FROM {{ref("int_local_bike__products")}} p
LEFT JOIN {{ref("int_local_bike__brands")}} b ON b.brand_id = p.brand_id