create table customer(cust_id int NOT NULL,fname varchar(50) NOT NULL,lname varchar(50) NOT NULL,cust_phone varchar(20) NOT NULL,cust_address varchar(255) NOT NULL,PRIMARY KEY(cust_id));

create table product(prod_id int NOT NULL,cart_id int not null,quantity int NOT NULL,prod_name varchar(50) NOT NULL,price int NOT NULL,PRIMARY KEY (prod_id),FOREIGN KEY (cart_id) REFERENCES cart(cart_id));


set nocount on
Declare @count int=3000
while(@count<=1000000)
Begin
	Declare @cust_id int =@count
    Declare @fname nvarchar(50)='ABC'+rtrim(@count)
    Declare @lname nvarchar(50)='C'+rtrim(@count)
    Declare @cust_phone nvarchar(50)='Phone'+rtrim(@count)
    Declare @cust_address nvarchar(50)='Adress'+rtrim(@count)
	insert into customer values(@cust_id,@fname,@lname,@cust_phone,@cust_address)
	set @count=@count+1
End
create table cust_phone(cust_id int NOT NULL,cust_phone varchar(20) NOT NULL,FOREIGN KEY (cust_id) REFERENCES customer(cust_id));
--


--
create table payment(pay_id int NOT NULL,cust_id int NOT NULL,amount int NOT NULL,PRIMARY KEY(pay_id),FOREIGN KEY(cust_id) REFERENCES customer(cust_id));

create table manages(prod_id int NOT NULL,emp_id int NOT NULL,FOREIGN KEY (emp_id) REFERENCES employee(emp_id),FOREIGN KEY(prod_id) REFERENCES product(prod_id));

create table buy_product (cust_id int NOT NULL,cart_id int NOT NULL,FOREIGN KEY (cust_id) REFERENCES customer(cust_id));
--




--
create table employee(emp_id int NOT NULL,fname varchar(50) NOT NULL,lname varchar(50) NOT NULL,emp_address varchar(255) NOT NULL,emp_phone varchar(20) NOT NULL,PRIMARY KEY(emp_id));

create table cart(cart_id int NOT NULL,prod_id int NOT NULL,quantity int NOT NULL,each_price int NOT NULL,total_price int NOT NULL,PRIMARY KEY(cart_id));

set nocount on
Declare @count int=3000
while(@count<=1000000)
Begin
	Declare @cart_id int =@count
    Declare @prod_id int =@count
    Declare @quantity int =100
    Declare @each_price int =500
    Declare @total_price int = 50000
	insert into cart values(@cart_id,@prod_id,@quantity,@each_price,@total_price)
	set @count=@count+1
End

create table emp_phone(emp_id int NOT NULL,emp_phone varchar(20) NOT NULL,FOREIGN KEY (emp_id) REFERENCES employee(emp_id));
--

-- after change
create table purchased as
select cust_id,prod_id
from payment;