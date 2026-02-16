SELECT
    customer_id,
    cast(concat(customer_first_name,' ',customer_last_name) as string) as customer_full_name,
    customer_first_name,
    customer_last_name,
    customer_phone,
    customer_email,
    customer_street,
    customer_city,
    customer_state,
    customer_zip_code
FROM {{ref("stg_local_bike__customers")}}