SELECT
    product_id,
    product_name,
    brand_id
    category_id,
    model_year,
    product_unit_price
FROM {{ref("stg_local_bike__products")}}