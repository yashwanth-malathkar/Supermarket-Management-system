-- display the name of employee, who manages the stock of product of higher price along with name of product
use grocery;
select fname,lname,prod_id,prod_name,each_price
from employee
join (select * from manages join product using (prod_id)) as t
using (emp_id)
order by each_price desc;