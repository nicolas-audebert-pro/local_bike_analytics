SELECT
	category_id,
    category_name,
    CASE 
        WHEN category_name LIKE 'Electric Bikes' THEN 'Electric Bikes'
        WHEN category_name LIKE 'Children Bicycles' THEN 'Children Bicycles'
        WHEN category_name LIKE 'Comfort Bicycles' 
             OR category_name LIKE 'Cruisers Bicycles' THEN 'Leisure Bikes'
        ELSE 'Sport Bikes'
    END AS range_name
FROM {{ ref("stg_local_bike__categories")}}