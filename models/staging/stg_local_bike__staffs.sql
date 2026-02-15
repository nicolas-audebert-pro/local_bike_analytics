SELECT
    staff_id,
    first_name,
    last_name,
    email,
    phone,
    active as is_active,
    store_id,
    CASE WHEN manager_id LIKE "NULL" THEN NULL ELSE manager_id END AS manager_id
FROM {{source("local_bike","staffs")}}