SELECT
    staff_id,
    first_name as staff_first_name,
    last_name as staff_last_name,
    email as staff_email,
    phone as staff_phone,
    active as staff_is_active,
    store_id,
    CASE WHEN manager_id LIKE "NULL" THEN NULL ELSE manager_id END AS manager_id
FROM {{source("local_bike","staffs")}}