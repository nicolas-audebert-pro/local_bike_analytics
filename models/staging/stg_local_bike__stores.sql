SELECT
    cast(store_id as INT64) as store_id,
    store_name,
    phone as store_phone,
    lower(trim(email)) as store_email,
    street as store_street,
    city as store_city,
    upper(state) as store_state,
    cast(zip_code as STRING) as store_zip_code
FROM {{source("local_bike","stores")}}