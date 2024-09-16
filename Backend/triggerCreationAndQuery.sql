use grocery;

create trigger cart_update
before insert 
on cart
for each row
set new.total_price = new.quantity * new.each_price;
 -- trigger is invoked whenever data is inserted into the table;

insert into cart(cart_id,quantity,each_price)
values (6,20,60),(7,10,70),(8,9,50);