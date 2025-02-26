{{
    config(
        materialized='table'
    )
}}

with fhv_dim_data as (
    select *
    from {{ ref('dim_fhv_trips') }}
)

select
    fhv_dim_data.dispatching_base_num,
    fhv_dim_data.pickup_datetime,
    fhv_dim_data.dropoff_datetime,
    fhv_dim_data.pulocationid, 
    fhv_dim_data.pickup_zone, 
    fhv_dim_data.dolocationid,  
    fhv_dim_data.dropoff_zone,
    fhv_dim_data.sr_flag,
    fhv_dim_data.affiliated_base_number,
    fhv_dim_data.year,
    fhv_dim_data.month,
    TIMESTAMP_DIFF(fhv_dim_data.dropoff_datetime, fhv_dim_data.pickup_datetime, SECOND) as trip_duration 
from fhv_dim_data
