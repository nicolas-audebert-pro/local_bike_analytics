SELECT
    staff_id,
    concat(staff_first_name,' ',staff_last_name) as staff_full_name,
    staff_first_name,
    staff_last_name,
    staff_email,
    staff_phone,
    staff_is_active,
    store_id,
    manager_id,
FROM {{ref("stg_local_bike__staffs")}}