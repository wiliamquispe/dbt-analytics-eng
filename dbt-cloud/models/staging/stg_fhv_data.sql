with 

source as (

    select * from {{ source('staging', 'fhv_data') }}

),

renamed as (

    select
        dispatching_base_num,
         -- timestamps
        cast(pickup_datetime as timestamp) as pickup_datetime,
        cast(dropoff_datetime as timestamp) as dropoff_datetime,
        pulocationid,
        dolocationid,
        sr_flag,
        affiliated_base_number

    from source

)

select * from renamed
where dispatching_base_num is not null