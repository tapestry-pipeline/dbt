
with zoom as (
    select EMAIL, FIRST_NAME, LAST_NAME
    from {{ source('snowflake', 'TAPESTRY_WEBINAR_REGISTRANTS') }}
),
sf as (
    select EMAIL, FIRSTNAME, LASTNAME
    from {{ source('snowflake', 'TAPESTRY_CONTACT') }}
)
select distinct coalesce(zoom.EMAIL, sf.EMAIL) as EMAIL, 
coalesce(zoom.FIRST_NAME, sf.FIRSTNAME) as FNAME,
coalesce(zoom.LAST_NAME, sf.LASTNAME) as LNAME
from zoom 
where EMAIL is not null
full join sf ON sf.EMAIL=zoom.EMAIL