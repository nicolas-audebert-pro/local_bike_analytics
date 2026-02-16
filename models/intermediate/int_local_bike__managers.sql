WITH staff_with_roles AS (
    SELECT
        staff_id,
        staff_full_name,
        staff_email
    FROM {{ ref("int_local_bike__staffs") }}
    WHERE manager_id is not null
)

SELECT
    staff_id as manager_id,
    staff_full_name AS manager_full_name,
    staff_email as manager_email
FROM staff_with_roles