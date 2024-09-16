-- 1) display the  total amount paid by the each customer for all their products
use grocery;
select cust_id,fname,lname,sum(amount) as total_bill
from payment
join customer 
using (cust_id)
group by cust_id
having sum(amount) > 5000;