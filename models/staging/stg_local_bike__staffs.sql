SELECT
    cast(staff_id as int64) as staff_id,
    cast(first_name as string) as staff_first_name,
    cast(last_name as string) as staff_last_name,
    cast(lower(trim(email)) as string) as staff_email,
    cast(phone as string) as staff_phone,
    cast(active as int64) as staff_is_active,
    cast(store_id as int64) as store_id,
    cast(CASE WHEN manager_id LIKE "NULL" THEN NULL ELSE manager_id END as int64) AS manager_id
FROM {{source("local_bike","staffs")}}