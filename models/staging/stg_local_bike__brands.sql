SELECT
	cast(brand_id as int64) as brand_id,
    brand_name
FROM {{ source("local_bike","brands")}}