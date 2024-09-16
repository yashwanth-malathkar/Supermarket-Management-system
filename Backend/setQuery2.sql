
-- select prodcut name whose quantity in the cart is atmost 26 and atmost 30 
-- intersection
use grocery;
select prod_name 
from product 
join cart using (cart_id)
where cart.quantity <= 26 and prod_name in (
select prod_name 
from product 
join cart using (cart_id)
where cart.quantity <=30);