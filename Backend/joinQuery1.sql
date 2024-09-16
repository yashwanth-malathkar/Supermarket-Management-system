-- simple queries
-- display the name of customers and their total price in ascending order
use grocery;
select fname,lname,sum(amount) as price
from customer
join payment
using (cust_id)
group by cust_id
order by price desc;