use grocery;
delimiter $$
create function total_price(price int,quantity int)
returns int 
deterministic
begin
return price*quantity;
end $$

--
select prod_name,total_price(each_price,quantity) as stock_price
from product;