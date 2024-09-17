-- select * from bike_share_yr_0;

with cte as ( -- In order to include the cost table, we updated the code.

-- This was the first step to join tables yr 1 and yr 2 together. Then, in order to join the cost table in our data, we used cte.
select * from bike_share_yr_1  
union all
select * from bike_share_yr_2)

-- This is esentially a V-Lookup, used to pick values in the cost table and include it in our already joined tables.
-- select * from cte a 
-- left join cost_table b
-- on a.yr = b.yr;

-- Decided to remove unnecessary columns for ease of reading the whole table

select 
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders*price as revenue, -- calculating a revenue column
riders*price - COGS as profit -- calculating the profit

from cte a 
left join cost_table b
on a.yr = b.yr;

