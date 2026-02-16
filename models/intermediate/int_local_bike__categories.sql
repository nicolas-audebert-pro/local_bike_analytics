SELECT
	category_id,
    category_name
FROM {{ ref("stg_local_bike__categories")}}