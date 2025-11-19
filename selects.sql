
-- Count clients by country
select country, count(*) as total
from clients
group by country
order by total;