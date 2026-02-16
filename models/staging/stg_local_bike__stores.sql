SELECT
    cast(store_id as INT64) as store_id,
    cast(store_name as string) as store_name,
    cast(phone as string) as store_phone,
    cast(lower(trim(email)) as string) as store_email,
    cast(street as string) as store_street,
    cast(city as string) as store_city,
    cast(upper(state) as string) as store_state,
    cast(zip_code as string) as store_zip_code
FROM {{source("local_bike","stores")}}