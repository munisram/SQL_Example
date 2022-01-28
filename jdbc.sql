create table user1 (id number primary key ,name varchar2(100),email varchar2(100));
create table admin (adminName varchar2(100),password varchar2(100));

select *from user1;

insert all 
into user1 values(1,'gokul','gokul@8.com')
into user1 values (4,'ragul','ragul@98.com')
select * from dual;
commit;
delete from admin;
desc admin;
select * from admin;