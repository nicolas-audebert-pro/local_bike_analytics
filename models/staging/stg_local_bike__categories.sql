SELECT
	cast(category_id as int64) as category_id,
    cast(category_name as string) as category_name
FROM {{ source("local_bike","categories")}}