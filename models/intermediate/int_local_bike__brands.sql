SELECT
	brand_id,
    brand_name
FROM {{ ref("stg_local_bike__brands")}}