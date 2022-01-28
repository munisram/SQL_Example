

select * from products;
--insert products--
--1 fitness watch--
insert into products values(1,'noisefit','track fitness',3000.00,2800.00,1);
insert into products values(2,'amazefit','track fitness',4000.00,3800.00,1);
insert into products values(3,'profit','track fitness',2000.00,1800.00,1);
insert into products values(4,'mifit','track fitness',5000.00,4500.00,1);

alter table products modify product_name varchar(40);
alter table products modify description varchar(50);
alter table products modify standard_cost number(13,2);
alter table products modify list_price number(13,2);
--2 smartphones--
insert into products values(5,'mi note 10','mid range smartphone',23000.00,22800.00,2);
insert into products values(6,'samsung m40','mid range smartphone',14000.00,13800.00,2);
insert into products values(7,'poco x3 pro','mid range gaming mobile',25000.00,24800.00,2);
insert into products values(8,'i phone 12 mini','mini version of iphone 12',55000.00,54500.00,2);

select * from tab;
select * from customers;
--insert customers--
insert into customers values(1,'mani','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(2,'hari','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(3,'suresh','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(4,'surya','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(5,'agis','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(6,'vinith','85,karambakkam,porur','www.amazon.com',50000.00);

select * from orders;
--orders--
insert into orders values(1,1,'shipped',1,'12-12-2021');
insert into orders values(2,1,'shipped',1,'13-12-2021');
insert into orders values(3,2,'packed',5,'14-12-2021');
insert into orders values(7,3,'delivered',1,'18-12-2021');
insert into orders values(5,2,'packed',5,'15-12-2021');
insert into orders values(6,5,'shipped',5,'12-12-2021');

update orders
set salesman_id = 1
where order_id in 6;

select * from order_items;

--insert order_items--
insert into order_items values(1,1,1,1,2800.00);
insert into order_items values(2,2,3,1,1800.00);
insert into order_items values(3,3,5,1,22800.00);
insert into order_items values(4,4,2,1,3800.00);
insert into order_items values(5,5,4,1,4500.00);
insert into order_items values(6,6,7,5,24800.00);

update order_items
set quantity = 5
where order_id in 1;


alter table employees modify email varchar(50);
--insert employees--
insert into employees values(1,'mani','kandan','manihfg,fjf@gmail.com',8685094302,'01-04-2019',4,'delivery boy');
insert into employees values(2,'suresh','kumar','sureshhfg,fjf@gmail.com',8685094302,'11-08-2019',6,'help and support');
insert into employees values(3,'hari','krishnan','harihfg,fjf@gmail.com',8685094302,'15-08-2019',6,'help and support');
insert into employees values(4,'abdul','agis','agishfg,fjf@gmail.com',8685094302,'25-05-2019',4,'manager');
insert into employees values(5,'surya','kumar yadav','suryahfg,fjf@gmail.com',8685094302,'29-07-2019',4,'delivery boy');
insert into employees values(6,'vinith','kumar','vinithhfg,fjf@gmail.com',8685094302,'28-09-2020',6,'manager');

select * from employees;
select * from orders;
select * from customers;
select*from tab;
select*from products;
select*from order_items;

select * from customers inner join orders on customers.customer_id=orders.customer_id;

select orders.order_date, sum(quantity*unit_price) as total_price from order_items
inner join orders on order_items.order_id=orders.order_id
group by orders.order_date ;




select orders.order_date, (quantity*unit_price) as total_price from order_items
inner join orders on order_items.order_id=orders.order_id
where orders.order_date between '12-12-21' and '18-12-21';

select  orders.order_date ,sum(quantity*unit_price) as total_price from order_items
inner join orders on order_items.order_id=orders.order_id
where orders.order_date= '18-12-21'
group by orders.order_date
having  ;

select * from order_items
where order_id in (4,5);



set serverout on

/
declare 
orders_date1 orders.order_date%type;
customer_name1 customer.customer_name%type;
BEGIN
select orders.order_date,customer.customer_name into orders_date1,customer_name1 from customer 
inner join orders on orders.customer_id=customer.customer_id
where orders.order_id=1;
DBMS_OUTPUT.PUT(orders_date1,customer_name1);
END;

/

declare 
no1 number :=&number;
no2 number :=&number;
begin
if(no1<no2)then
dbms_output.put_line('no2 is greterthan');
else
dbms_output.put_line('no1 is greterthan');
end if;
dbms_output.put_line('value is' ||no1||' '||no2);
end;
/
declare 
n2 number:='&num2';
n1 number:='&num';

begin
loop
dbms_output.put_line(n1*n2);
if (n2=10) then
exit ;
end if;
n2:=n2+1;
end loop;
end;
/



declare 
 email employee.email%type;
 id    employee.id%type;
 loop 



/
declare 
c_name customer.name%type;
c_credit customer.credit_limit%type:=&credit;

begin
select name into c_name from customer
where credit_limit=c_credit;
dbms_output.put_line('customer name : ' || c_name);
exception
when no_data_found then
dbms_output.put_line('credit not found');

when TOO_MANY_ROWS then
dbms_output.put_line('many row do not initialize ');
end;
/
set serverout on
/
declare
a number:=10;
begin 
while(a<20)
loop
   a:=a+1;
dbms_output.put_line(to_char(a));
end loop;
end;
/
declare
a number:=0 ;
begin 

for i in 1..10 loop
 a:=a+i;
dbms_output.put_line(to_char(a)||' '||to_char(i));  
end loop;
end;
/
declare
a number:=0 ;
begin 

for i in reverse 1..10 loop
 a:=a+i;
dbms_output.put_line(to_char(a)||' '||to_char(i));  
end loop;
end;
\
select * from employee;
\

\
declare
id employee.id%type:=2;
begin
delete from employee where employee.id=id;
dbms_output.put_line(SQL%ROWCOUNT||'row delete');

end;
\
set serveroutput on

declare
begin
dbms_output.put_line('sindhu');
end;
\

select * from employee;
set serveroutput on
/
declare 
f_name employee1.first_name%type;
l_name employee1.last_name%type;
cursor c_d is select employee1.first_name,employee1.last_name into f_name,l_name from employee1;
begin
open c_d;
loop
fetch c_d into f_name,l_name;
dbms_output.put_line(c_d%rowcount||' fetch row');
exit when c_d%notfound;

dbms_output.put_line(f_name||' '||l_name);
end loop;
close c_d;
end;
/

declare 
id employees.employee_id%type;
j_b employees.job_title%type;
f_name employees.first_name%type;
cursor v_d is select employees.first_name,employees.job_title  from employees
where employees.employee_id=id;
begin
id :=&id;
open v_d;
loop
fetch v_d into f_name,j_b ;
exit when v_d%notfound;
dbms_output.put_line(f_name||' '||j_b);
end loop;
close v_d;
end;
/



set serveroutput on

create or replace procedure prof(a number,b number)
is 
begin 
dbms_output.put _line(to_char(a+b));
end;
/
execute prof(2,1);
 
   
---tables----  
 select* from products;
 select* from orders;
 select* from employees;
 select* from order_items;
 select* from customers;
   select * from product_categories;
   
 drop table product_categories cascade CONSTRAINTS;  
 set serveroutput on; 
 
 
 
 
 
 
 
 CREATE OR REPLACE PACKAGE sales AS
--------------------customer
---------------add
procedure addcustomers(
                        c_name1 in customers.c_name%type,
                        c_address in customers.address%type,
                        c_web in customers.website%type,
                        c_l in customers.credit_limit%type,
                         p_status out varchar2,
                        p_error out varchar2);
--------------------------------------delect
procedure deletecustomers(c_id in customers.customer_id%type, p_status out varchar2,p_error out varchar2);
------------------------category
procedure addcategory(cate_name in category.category_name%type,p_status out varchar2,p_error out varchar2);

-------------------products
   PROCEDURE addproduct(
   p_name in products1.product_Name%type,
   p_stprice in  products1.standard_cost%type,
   p_lprice in products1.list_price %type,  
   cate_id in  products1.category_id%type,
    p_status out varchar2,
   p_error out varchar2);  
   -- Removes a product
      PROCEDURE delproduct(p_id in products1.product_id%TYPE,p_status out varchar2,p_error out varchar2);
      -----employee
------------------------add
procedure Addemployee(
                    emp_first in  employee1.first_name%type ,
                    emp_lastname in employee1.last_name%type ,
                    emp_email in employee1.email%type,
                    emp_pho  in employee1.phone%type,
                    emp_hdate in employee1.hire_date%type,
                    emp_mid in employee1.manager_id%type,
                    emp_job in employee1.job_title%type,p_status out varchar2,p_error out varchar2);

---delete employee
PROCEDURE Delemployee(emp_id in employee1.employee_id%TYPE,p_status out varchar2,p_error out varchar2);
   ---------order table
   PROCEDURE addorder(
                  c_id in order1.customer_id%type,
                  o_status in  order1.status%type,
                  emp_id in order1.employee_id %type,  
                  o_date in order1.order_date%type,p_status out varchar2,p_error out varchar2);
   ------------delect
 procedure deleteorder (o_id in order1.order_id%type,p_status out varchar2,p_error out varchar2);
 ----order_items
 --------------add
 procedure additems(o_id in order_items.order_id%type,
                   p_id in order_items.product_id%type,
                    qty in order_items.quantity%type,
                    u_p in order_items.unit_price%type,p_status out varchar2,p_error out varchar2);
-----------------delect
procedure deleteitems(i_id in order_items.item_id%type,p_status out varchar2,p_error out varchar2);
END sales;
/


------package body-----
select * from customers;

CREATE OR REPLACE PACKAGE body sales  AS
-----------------------add customer

  procedure addcustomers(
                        c_name1 in customers.c_name%type,
                        c_address in customers.address%type,
                        c_web in customers.website%type,
                        c_l in customers.credit_limit%type,
                         p_status out varchar2,
                        p_error out varchar2) is
begin
insert into customers(c_name,address,website,credit_limit)values(c_name1,c_address,c_web,c_l);
if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then  
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
end addcustomers;

procedure deletecustomers(c_id in customers.customer_id%type,p_status out varchar2,p_error out varchar2) is
begin
delete from customers where customer_id=c_id;
if Sql%rowcount>0 then
         p_status:='deleted';
          end if;
          if sql%rowcount=0 then
          p_status :='not deleted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
   end deletecustomers;
   -----------------------------categories
   procedure addcategory(cate_name in category.category_name%type,p_status out varchar2,p_error out varchar2) is
   begin
   insert into category(category_name)values(cate_name);
        if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then  
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
end addcategory;

----------------------------------delect
procedure delcategories(cate_id in category.category_id%type,p_status out varchar2,p_error out varchar2) is
begin
delete from category where category_id=cate_id;
if Sql%rowcount>0 then
         p_status:='deleted';
          end if;
          if sql%rowcount=0 then
          p_status :='not deleted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
  end delcategories;
   -- Adds a product
   
   PROCEDURE addproduct(
   p_name in products1.product_Name%type,
   p_stprice in  products1.standard_cost%type,
   p_lprice in products1.list_price %type,  
   cate_id in products1.category_id%type,
     p_status out varchar2,p_error out varchar2) is
   
    BEGIN
      INSERT INTO products1(product_Name,standard_cost,list_price,category_id)
         VALUES( p_name, p_stprice, p_lprice, cate_id);
         if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
END addproduct;  

--   --------------------delete product
   PROCEDURE delproduct(p_id  products1.product_id%type,p_status out varchar2,p_error out varchar2) IS
   BEGIN
      DELETE FROM products1 WHERE product_id = p_id ;
              if SQL%ROWCOUNT >0 then
                      p_status:='Deleted';
                 end if;
             if sql%rowcount=0
                then p_status:='No Value Deleted';
                end if;
exception
  when others then
   p_status:='Somthing went wrong';
   p_error:=sqlcode ||' '|| sqlerrm;
   END delproduct;
   
     ----------------------employee
--   ----------------------------------add
   
   procedure Addemployee(
                            emp_first in  employee1.first_name%type ,
                            emp_lastname in  employee1.last_name%type ,
                            emp_email in employee1.email%type,
                            emp_pho in employee1.phone%type,
                            emp_hdate in employee1.hire_date%type,
                            emp_mid in employee1.manager_id%type,
                            emp_job in employee1.job_title%type,p_status out varchar2,p_error out varchar2)is
                           
begin
insert into employee1(first_name,last_name,email,phone,hire_date,manager_id,job_title)values(emp_first,emp_lastname,emp_email,emp_pho,emp_hdate,emp_mid,emp_job);
    if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
   COMMIT;
   END Addemployee;

----delete employees---
PROCEDURE Delemployee(emp_id  employee1.employee_id%type,p_status out varchar2,p_error out varchar2) IS
   BEGIN
     
         DELETE FROM employee1 WHERE employee_id = emp_id ;
              if SQL%ROWCOUNT >0 then
                      p_status:='Deleted';
                 end if;
             if sql%rowcount=0
                then p_status:='No Value Deleted';
                end if;
exception
  when others then
   p_status:='Somthing went wrong';
   p_error:=sqlcode ||' '|| sqlerrm;
     commit;
   END Delemployee;
   
--   ------------order table
      PROCEDURE addorder(c_id in order1.customer_id%type,
                          o_status in order1.status%type,
                          emp_id in order1.employee_id%type,  
                        o_date in order1.order_date%type,p_status out varchar2,p_error out varchar2) is
                           
    BEGIN
      INSERT INTO order1(customer_id,status,employee_id,order_date) VALUES( c_id, o_status, emp_id, o_date);
         if Sql%rowcount>0 then
                      p_status:='inserted';
          end if;
          if sql%rowcount=0 then
                              p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
COMMIT;
END addorder;
   -----order delete
   procedure deleteorder(o_id IN order1.order_id%type,p_status out varchar2,p_error out varchar2) IS  
    begin
   delete from order1 where order_id= o_id;
            if SQL%ROWCOUNT >0 then
                      p_status :='Deleted';
                 end if;
             if sql%rowcount=0
                then p_status :='No Value Deleted';
                end if;
exception
  when others then
   p_status:='Somthing went wrong';
   p_error:=sqlcode ||' '|| sqlerrm;
   COMMIT;
   end deleteorder;
          ---------------------------order_items
   procedure additems(o_id in order_items.order_id%type,
                   p_id in order_items.product_id%type,
                    qty in order_items.quantity%type,
                    u_p in order_items.unit_price%type,p_status out varchar2,p_error out varchar2) is
    begin
    insert into order_items(order_id,product_id,quantity,unit_price)values(o_id,p_id,qty,u_p);
             if Sql%rowcount>0 then
                      p_status:='inserted';
          end if;
          if sql%rowcount=0 then
                              p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
COMMIT;
   end additems;
   
   -----------------------delect items
   procedure deleteitems(i_id in order_items.item_id%type,p_status out varchar2,p_error out varchar2) IS  
begin
   delete from order_items where item_id=i_id;
      if SQL%ROWCOUNT >0 then
                      p_status:='Deleted';
                 end if;
             if sql%rowcount=0
                then p_status:='No Value Deleted';
                end if;
exception
  when others then
   p_status:='Somthing went wrong';
   p_error:=sqlcode ||' '|| sqlerrm;
   COMMIT;
   end deleteitems;
  END sales;
/

   
   

set serveroutput on

declare
p_status varchar2(199);
p_error varchar2(500);
begin
sales.Addemployee('rahul','r','rahul.com',9992376145,'19-10-19',3,'HR',p_status,p_error);
dbms_output.put_line(p_status||p_error);
end ;
/
declare
p_status varchar2(199);
p_error varchar2(500);
begin
sales.Delemployee(2,p_status,p_error);
dbms_output.put_line(p_status||p_error);
end ;
/
select * from employee1;

 declare 
 p_status varchar2(199);
p_error varchar2(500);
 begin 
 sales.addcustomers('mani','85,karambakkam,porur','www.amazon.com',50000.002,p_status,p_error);
dbms_output.put_line(p_status|| ' '|| p_error);
end;
/
declare 
 p_status varchar2(199);
p_error varchar2(500);
begin 
sales.deletecustomers (503,p_status,p_error);
dbms_output.put_line(p_status ||' '||p_error);
end;
/
select * from customers;
/ 
 declare 
 p_status varchar2(199);
p_error varchar2(500);
 begin 
 sales.addproduct('mid range smartphone',23000.00,22800.00,5001,p_status,p_error);
dbms_output.put_line(p_status|| ' '|| p_error);
end;
/
 
 declare 
 p_status varchar2(199);
p_error varchar2(500);
begin 
sales.addproduct (1,p_status,p_error);
dbms_output.put_line(p_status ||' '||p_error);
end;
 /
 select * from products1;
 desc products1;
 /
 select * from category;
 /
  declare 
 p_status varchar2(199);
p_error varchar2(500);
 begin 
 sales.addcategory('mobile',p_status,p_error);
dbms_output.put_line(p_status|| ' '|| p_error);
end;
 /
 
 
 
 desc products1;
 select * from products1;
 ---
/

 CREATE OR REPLACE FUNCTION product2(
   p_name products1.product_name%type,
 
   l_price products1.list_price%type
   
) 
RETURN NUMBER
IS
    p_id NUMBER := 0;
BEGIN


SELECT product_id
    INTO p_id
    FROM products1 
    WHERE product_name=p_name and list_price=l_price;
    RETURN p_id ;
END;

/
select product2('mid range smartphone',22800) from products1 ;

/
SELECT * FROM PRODUCT1;


create table triger (table_name varchar2 (200), transaction_name varchar2 (200), by_user varchar2(200), transaction_date date );

select * from triger;

/

CREATE OR REPLACE TRIGGER customers_audit_Trig
    AFTER 
    UPDATE OR DELETE 
    ON customers
    FOR EACH ROW    
DECLARE
   l_transaction VARCHAR2(10);
BEGIN
   -- determine the transaction type
   l_transaction := CASE  
         WHEN UPDATING THEN 'UPDATE'
         WHEN DELETING THEN 'DELETE'
   END;

   -- insert a row into the audit table   
   INSERT INTO triger  (table_name, transaction_name, by_user, transaction_date)
   VALUES('CUSTOMERS', l_transaction, USER, SYSDATE);
END ;
/
set serveroutput on


 
 

 
 
set serveroutput on

/
create or replace package  categories as
procedure addcatagories (
p_name in product_categories.catagory_name%type,
p_status out varchar2,
p_error out varchar2);
end categories;
/
/
create or replace package body categories as
procedure addcatagories (
p_name in product_categories.catagory_name%type,
p_status out varchar2,
p_error out varchar2)
is
begin
insert into product_categories (catagory_name)
    values (p_name);

if sql%rowcount >0 then 
p_status:='values insert';
end if;
exception when others then 
p_error:=sqlcode || sqlerrm;
commit;
end addcatagories;

end categories;
/
set serveroutput on
declare 
p_status varchar2 (200);
p_error varchar2 (100);
begin 
 categories.addcatagories('szxdcfvghjk',p_status,p_error);
 dbms_output.put_line (p_status||' '|| p_error);
 end;
 /
select * from product_categories;






create table customers(customer_id int GENERATED ALWAYS AS IDENTITY START WITH 501 primary key,
c_name varchar(20),
address varchar(20),
website varchar(20),
credit_limit number(7,2));

drop table category CASCADE CONSTRAINTS;

select * from employee1;

drop table  employee1  CASCADE CONSTRAINTS;

create table category(category_id int GENERATED ALWAYS AS IDENTITY START WITH 5001 primary key,category_name varchar2(30));

select * from category;
--desc category
create table products1(product_id int GENERATED ALWAYS AS IDENTITY START WITH 5001 primary key
    ,product_name varchar(40),
    standard_cost number(13,2),
    list_price number(13,2),
    category_id int);
    
select * from products1;

create table order_items(item_id int GENERATED ALWAYS AS IDENTITY START WITH 101 primary key
                                ,order_id int 
                            ,product_id int
                                ,quantity int
                                ,unit_price number(7,2),
                            FOREIGN key(product_id) REFERENCES products1(product_id),
                            FOREIGN key(order_id) REFERENCES order1(order_id));

select * from order_items;

create table order1(order_id int GENERATED ALWAYS AS IDENTITY START WITH 1001 primary key,
    customer_id int,
    status varchar(20),
    employee_id int,
    order_date date,
    FOREIGN key(customer_id) REFERENCES customers(customer_id),
    FOREIGN key(employee_id) REFERENCES employee1(employee_id));

select * from order1;

create table employee1(employee_id int GENERATED ALWAYS AS IDENTITY START WITH 1 primary key,
                first_name varchar(20),
                last_name varchar(20),
                email varchar(40) UNIQUE,
                phone int UNIQUE,
                hire_date date,
                manager_id int,
                job_title varchar(20));

select * from customers;
select * from employee1;










