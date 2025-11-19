
-- Count clients by country
select country, count(*) as total
from clients
group by country
order by total;
-- Count clients by country and gender
select country, gender, count(*) as total
from clients
group by country,gender
order by total;