{{ config(materialized='table') }}

with trips as 
(
select
	t.id
	,date(t.started_at) as date
	,DATE_PART('year', AGE(t.started_at, u.birth_date))::int AS age
from scooters_raw.trips as t
inner join scooters_raw.users as u
	on t.user_id = u.id
)

,agg as 
(
select 
	date
	,age
	,count(1) as cnt
from trips
group by date, age
)

,result as 
(
select
	age
	,avg(cnt) as avg_trips
from agg
group by age
)

select * from result
order by age desc