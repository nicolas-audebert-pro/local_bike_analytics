SELECT
	cast(category_id as int64) as category_id,
    category_name
FROM {{ source("local_bike","categories")}}