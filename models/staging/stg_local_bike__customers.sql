SELECT
    cast(customer_id as int64) as customer_id,
    cast(first_name as string) as customer_first_name,
    cast(last_name as string) as customer_last_name,
    cast(phone as string) as customer_phone,
    cast(lower(trim(email)) as string) as customer_email,
    cast(street as string) as customer_street,
    cast(city as string) as customer_city,
    cast(upper(state) as string) as customer_state,
    cast(zip_code as string) as customer_zip_code
FROM {{ source("local_bike","customers")}}