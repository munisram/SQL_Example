select * from lms_book_details;

update  lms_book_details set AUTHOR='dfgh'  where book_code='BL000002';

select * from lms_book_issue;
select category,count(book_code) from lms_book_details group by category;

declare
b_code lms_book_details.book_code%type;
b_title lms_book_details.book_title%type;
p_date lms_book_details.publish_date%type;
cursor c_name is select lms_book_details.book_code,lms_book_details.book_title,lms_book_details.publish_date from lms_book_details;
begin 
open c_name;
loop

fetch c_name into b_code,b_title,p_date ;

exit when c_name%ROWCOUNT>5;
dbms_output.put_line(b_code||b_title||p_date);
end loop;
close c_name;
end ;
/
set serveroutput on
/*
Problem # 2:
Write a query to display the book code, publication, price and supplier name of the book witch is taken frequently.
*/

declare 
a number :=1;
begin 
while(a>0)
loop
dbms_output.put_line(to_char(a));
end loop;
end;
/



create table trigger_table(table_name varchar2 (100),status varchar2(100),
user_name varchar2(50),current_date date );
/
drop table trigger_table;



set serveroutput on

create or replace trigger munis 
 after 
 update or delete 
 on lms_book_details
 for each row 
 declare  
 action varchar2(34);
 begin
 action:=case
 when updating then 'update'
 when deleting then 'delete'
 end;
 insert into trigger_table (table_name,status,user_name,current_date)
 values('lms_book_details',action,user,sysdate);
 end munis;


select * from trigger_table;

SELECT * FROM lms_book_details;
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION MARI (B_LM lms_book_details.BOOK_EDITION%TYPE,
P_LMS lms_book_details.price%TYPE)
RETURN  VARCHAR2 
IS
B_CODE VARCHAR2(100);
 
BEGIN
SELECT BOOK_TITLE INTO B_CODE FROM lms_book_details WHERE lms_book_details.BOOK_EDITION=B_LM AND lms_book_details.price=P_LMS;
RETURN B_CODE;
END;

SELECT MARI(6,600)FROM lms_book_details;



DESC lms_book_details;



select a.book_code,a.publication,b.supplier_name,a.price from lms_book_details a inner join lms_suppliers_details b on a.supplier_id=b.supplier_id
where book_code in 
(select book_code from lms_book_issue group by book_code having count(book_issue_no)>1);





