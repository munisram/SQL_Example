create table customer(customer_id int primary key,customer_name varchar2(32),addrees varchar2(100),website varchar2(32),
                        credit_limit int);
desc customer
alter  table customer  MODIFY credit_limit int not null;
select * from customer;
create table orders (order_id int PRIMARY KEY key);
select * from orders;

insert into orders values(1,1,'shipped',1,'12-12-2021');
insert into orders values(2,1,'shipped',1,'13-12-2021');
insert into orders values(3,2,'packed',5,'14-12-2021');
insert into orders values(4,3,'delivered',1,'18-12-2021');
insert into orders values(5,2,'packed',5,'15-12-2021');
insert into orders values(6,5,'shipped',5,'12-12-2021');
