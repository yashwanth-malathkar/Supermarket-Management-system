-- set operation 1
 -- select customer names who made payment above 5000 or less than 2500
use grocery;
 select fname,lname
 from customer
 natural join payment 
 where amount > 5000
 union
 select fname,lname
 from customer
 natural join payment 
 where amount < 2500;