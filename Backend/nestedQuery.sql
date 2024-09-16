-- 1)nested query
-- select name of customer ,who has made payment for product;
use grocery;
select fname,lname 
from customer
where cust_id in (select cust_id from payment);