use grocery;
select cust_id,fname,lname,sum(amount) as total_bill 
from payment join customer using (cust_id) 
where exists (select * from payment where payment.cust_id = customer.cust_id
group by cust_id having sum(amount) >= 8000)
group by cust_id;