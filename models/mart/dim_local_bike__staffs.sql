SELECT
    staff_id,
    staff_full_name,
    staff_first_name,
    staff_last_name,
    staff_email,
    staff_phone,
    staff_is_active,
    store_id,
    s.manager_id,
    manager_full_name
FROM {{ref("int_local_bike__staffs")}} s
LEFT JOIN {{ref("int_local_bike__managers")}} m ON m.manager_id = s.manager_id