 -- 2) display the number of products and name of that product  that the customer  had bought;
 use grocery;
 select cust_id,count(prod_id) as no_of_products,prod_name as product_name
 from purchased
 join product using (prod_id)
 group by cust_id
 having count(prod_id) > 1;