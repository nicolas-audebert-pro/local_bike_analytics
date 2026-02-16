SELECT
    cast(customer_id as int64) as customer_id,
    first_name as customer_first_name,
    last_name as customer_last_name,
    phone as customer_phone,
    lower(trim(email)) as customer_email,
    street as customer_street,
    city as customer_city,
    upper(state) as customer_state,
    zip_code as customer_zip_code
FROM {{ source("local_bike","customers")}}