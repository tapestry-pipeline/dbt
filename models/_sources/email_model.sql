

-- /*
--     Welcome to your first dbt model!
--     Did you know that you can also configure models directly within SQL files?
--     This will override configurations stated in dbt_project.yml

--     Try changing "table" to "view" below
-- */

--  {{ config(materialized='incremental',unique_key='EMAIL' ) }}
-- {{ config(materialized='table') }}

with zoom as (

    select EMAIL, FIRST_NAME, LAST_NAME
    from {{ source('snowflake', 'TAPESTRY_WEBINAR_REGISTRANTS') }}
    where EMAIL is not null
    

),

sf as (

    select EMAIL, FIRSTNAME, LASTNAME
    from {{ source('snowflake', 'TAPESTRY_CONTACT') }}
    where EMAIL is not null
    
)

select distinct coalesce(zoom.EMAIL, sf.EMAIL) as EMAIL, 
coalesce(zoom.FIRST_NAME, sf.FIRSTNAME) as FNAME,
coalesce(zoom.LAST_NAME, sf.LASTNAME) as LNAME
from zoom
full join sf ON sf.EMAIL=zoom.EMAIL




-- /*
--     Uncomment the line below to remove records with null `id` values
-- */

-- -- where id is not null
