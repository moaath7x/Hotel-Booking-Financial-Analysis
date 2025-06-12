with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']
)

--select * from hotels

select arrival_date_year as Year,hotel as Hotel,
round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as Revenue,
meal_cost$.Cost as Cost
from hotels
left join dbo.meal_cost$
on hotels.meal = dbo.meal_cost$.meal
left join dbo.market_segment$
on hotels.market_segment = dbo.market_segment$.market_segment
group by arrival_date_year,hotel,meal_cost$.Cost

