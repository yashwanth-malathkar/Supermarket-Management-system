-- 2) co-related query
-- select products that are present in the customers cart
use grocery;
select prod_name 
from product
where exists (select * from cart);