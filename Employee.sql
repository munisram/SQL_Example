create table region (id int primary key ,name varchar(50));
insert all
into region  values(1,'Europe')
into region values(2,'Americas')
into region values(3,'Asia')
into region values(4,'Middle east and africa')
select *from dual;
CREATE table countries (id int primary key ,name varchar(50),region_id int,
foreign key (region_id) references region(id));
alter table countries MODIFY id varchar(50);
insert all
into Countries values('AR','ARgentina',2)
into Countries values('AU','Australia',3)
into Countries values('BE','Belgium',1)
into Countries values('BR','BRAZIL',2)
into Countries values('CA','Canada',2)
into Countries values('CH','Switzerland',1)
into Countries values('CN','China',3)
into Countries values('DE','Germany',1)
into Countries values('DK','Denmark',1)
into Countries values('EG','Egpty',4)
into Countries values('FR','France',1)
into Countries values('HK','Hongkong',3)
into Countries values('IL','Isreal',4)
into Countries values('IN','India',3)
into Countries values('IT','Italy',1)
into Countries values('JP','Japan',3)
into Countries values('KW','Kuwait',4)
into Countries values('Mx','Mexico',2)
into Countries values('NG','Nigeria',4)
into Countries values('NL','Netherlands',1)
into Countries values('SG','Singapore',3)
into Countries values('UK','United Kingdom',1)
into Countries values('US','United States of America',2)
into Countries values('ZM','ZAMBIA',4)
into Countries values('zw','Zimbabwe',4)
select *from dual;
Create table location
(id varchar(50) primary key,
street_address varchar(50),
postal_code varchar2(50),
city varchar(50),
state varchar(50),
country_id varchar(50),
foreign key(country_id) references countries(id)
);
insert into location values('1000', '1297 via cola di rie',989, 'Roma','Roma','IT');
insert into location values('1001', '1297 via cola di rie',990, 'Roma','Roma','IT');
insert all
into location values(1100,'93091 Calle della testa', 10934,'Venice','venice','IT')
into location values(1200,'2017 ShinJUKU-KU',1689,'Tokyo','Tokyo prefecture','JP')
into location values(1300,'9450 Kamya-Cho',6823,'Hiroshima','hiroshi','JP')
into location values(1400,'2014 Jabberwocky RD', 26192, 'South lake','Texas','US')
into location values(1500,'2011 Interiors BLVD',99236,'South sanFrancisco','California','US')
into location values(1600,'2007 Zagora ST',50090,'South bruncswick','New Jersey','US')
into location values(1700,'2004 Charade Rd',98199,'Seattle','washington','US')
into location values(1800,'147 Spadna Ave','MSV 2L7','Toronto','Ontario','CA')
into location values(1900,'6092-BoXwood ST','YSW 9T2','Whitehorse','Yukon','CA')
into location values(2000,'40-5-12 Laogianggen',190518,'Beijing','Beijing','CN')
into location values(2100, '1298 VILEPARLE ed',490231,'BOMBAY','Maharasthra','IN')
into location values(2200,'12-98 Victoria Street',2901,'Sydney','New South wales','AU')
into location values(2300,'198 Clementi North',540198,'Singapore','Singapore','SG')
into location values(2400,'B204 Arthur ST',2345,'London','LOndon','UK')

into location values(2600,'9702 Chester Road',9629850293,'Stretford','Manchester','UK')
into location values(2700,'Schwanthalerstr, 7301',80925,'Munich','Bavaria','DE')
into location values(2800,'RUA FREI Caneca 1360','01307-002','SAO Paulo','SAOPaulo','BR')
into location values(2900,'20 RUE DES Corps-Saints',1730,'Geneva','Geneve','CH')
into location values(3000,'MURTENSTRASSE 921',3095,'BERN','BE','CH')
into location values(3100,'PIETER BREUGHELSTRAAT B37','3029SK','UTRECHIT','UTRECHIT','NL')

select *from dual;
Create table department
(id int primary key,
name varchar(50),
location_id varchar(50),
foreign key(location_id) references location(id)
);
insert all
into department values
(1,'Accounts',1000)
into department values(2,'HR',1600)
into department values(3,'Business Development',1800)
into department values(4,'IT Support',2400)
into department values(5,'IT',3100)
select*from dual;
Create table employee
(id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
phone_number varchar(50),
hire_datet date,
salary int,
date_of_birth date,
department_id int ,
foreign key(department_id) references department(id)
);
Insert into employee
values(1,'anu','sharma','anu@gmail.com',9864675634,'07-12-2015',20000,'01-12-1998',5);
Insert into employee
values(2,'ananthi','sharma','ananthi@gmail.com',8608491910,'08-03-1995',22000,'03-21-1994',3);
Insert into employee
values(3,'amarnath','pillai','amarnath@gmail.com',7894589654,'07-03-2005',38000,'01-12-1995',4);
Insert into employee
values(4,'clinton','pritheev','clinton@gmail.com',7708480901,'06-01-2005',23000,'09-05-1994',2);
Insert into employee
values(5,'collin','paul','collin@gmail.com',9842524655,'06-02-2016',30500,'12-2-1996',1);
Insert into employee values(
6, 'haritha', 'mohan', 'haritha@gmail.com', '7710589123', '07-2-2006', '41000', '06-12-1993', 4);
Insert into employee values
(7, 'shrihari', 'pillai', 'shrihari@gmail.com', '9842512456', '07-01-2005', '21000', '05-01-1995', 2);
Insert into employee values
(8, 'jeeva', 'annath', 'jeeva@gmail.com', '8608491912', '06-02-2013',
'28000', '12-3-2019', 3);
Insert into employee values
(9, 'jimesh', 'sharma', 'jimesh@gmail.com', '9634565231', '05-06-2019', '51000', '10-2-1992', 1);
Insert into employee values
(10, 'giruba', 'dharan', 'giri@gmail.com', '9842524655', '06-02-2012',
'24000', '11-2-1990', 2);
Insert into employee values
(11, 'karthiga', 'pillai', 'karthi@gmail.com', '8608491510', '08-04-2003', '32000', '08-2-1993', 4);
insert into employee values(12,'MADHU','SHARMA'
,'MADHU@GMAIL.COM',9865478963,'06-03-2014',34000,'05-01-1995',2);
insert into employee
values(13,'MADHAN','KUMAR','MADHAN@GMAIL.COM',8608491810,'06-02-2014',25500,'01-11-1993',3);
Create table manager
(employee_id int,
department_id int,
primary key(employee_id,department_id),
foreign key(employee_id) references employee(id),
foreign key(department_id) references department(id)
);
Insert into manager(department_id,employee_id) values (1,9);
Insert into manager(department_id,employee_id)values (2,19);
Insert into manager(department_id,employee_id)values(2,4);
Insert into manager(department_id,employee_id)values(3,17);
Insert into manager(department_id,employee_id)values(3,8);
Insert into manager(department_id,employee_id)values(4,15);
Insert into manager(department_id,employee_id)values(5,1);


select *from countries;
select *from region;
select *from location;
select *from employee;
select *from department;
/*Write a query to display the names of all states belonging to the country
Canada. Display the records sorted in ascending order based on state
name.(Q 2).*/
select state  from location
where country_id in (select id from countries where name ='Canada')
order by state;
/*Write a query to display the addresses (location id, street_address, city,
state_province, country_name) of all the entries in the location
table.Display the records sorted in ascending order based on location id.
[Use Inner Join](Q3)*/
select location.id,location.street_address,location.city,location.state,countries.name as country_name
from location inner join countries on location.country_id=countries.id;
/*19.Write a query to display the department name and the first name of
managers of all departments. Display the records sorted in ascending
order based on department name and then by manager name.[Use inner
join or join](Q4)*/
select department.name,employee.first_name
from  department inner join employee on employee.department_id=department.id 
order by department.name asc;
/*15.Write a query to display the first name of all employees who are
managers. Display the records sorted in ascending order based on first
name.(Q5)*/
select employee.first_name ,department.name from employee
inner join department on employee.department_id=department.id
order by employee.first_name asc;
/*Write a query to display the first name of the managers of HR
department. Display the records sorted in ascending order based on
manager name(Q6)*/
select first_name as manager_name ,department.name from employee 
inner join department on employee.department_id=department.id
inner join  manager on manager.department_id=department.id
where department.name='HR'
order by manager_name;
/*Write a query to display the first name of the managers of Accounts
department. Display the records sorted in ascending order based on manager
name.(Q7).*/
select employee.first_name,department.name from employee
inner join department on employee.department_id=department.id
inner join manager on manager.employee_id=employee.id
where name='HR' order by department.name asc;

/*Write a query to display the id,entire street address and the last word of the
street address of all entries in the location table. Give an alias to the last word
as 'last_word'. Display the records sorted in ascending order based on
last_word.(Q9)*/

select location.id,substr(location.street_address,instr(street_address,' ',-1)+1)as last_word
from location
order by last_word;

select *from location;
/*Write a query to display the id, entire street address and the first word of the
street address of all entries in the location table. Give an alias to the first word
as 'first_word'. Display the records sorted in ascending order based on
first_word.(Q10)*/

select location.id,substr(location.street_address,1,instr(street_address,' ')-1) as t from location 
order by t;
select *from employee;
/*13.Write a query to display the first name and the last 5 characters of phone
numbers of all employees. Display the records sorted in ascending order
based on first name. Give an alias to the last 5 characters of phone
number as phone_number(Q8).*/
select employee.id,substr(employee.phone_number,length(phone_number)-4)as last_5_digit from employee;
/*or*/
select employee.first_name,substr( employee.phone_number,6,10)as last_5_characters from employee
order by first_name;

select employee.id,substr(date_of_birth,instr(employee.date_of_birth,'-')+1,instr(employee.date_of_birth,'-')-1) as dob from employee;
/*11.Write a query to display the first name and salary for all employees.
Format the salary to be 10 characters long, left-padded with the $ symbol.
Display the records sorted in ascending order based on first name.(Q11).*/
select employee.first_name,TO_CHAR(salary,'$99999.9999')as  characters_long from employee
order by employee.first_name;

/*18.Write a query to display the location_id, street_address, city,
state_province, country_name, region_name of all the entries in the
location table.Display the records sorted by location_id.
[Use Left Join](Q12)*/
select location.id,location.street_address,location.city,location.state as stste_province,
countries.name as country_name,region.name as region_name
from location left join countries on location.country_id=countries.id 
left join region on countries.region_id=region.id
order by location.id;

/*Write a query to find the addresses (department name, location id as id ,
street_address, city, state_province, country_name) of all the departments.
Display the records sorted in ascending order based on department
name.(Q13)*/
select  location.id as id , department.name,location.street_address,location.city,
location.state as state_province, countries.name as country_name from department left join location on department.location_id=location.id 
left join countries on location.country_id=countries.id
order by location.id;
/*Write a query to find the first name and department name of employees who
work in city London. Display the records sorted in ascending order based on
first name.(Q14).*/


select employee.first_name,department.name from employee
left join department on department.id= employee.department_id
order by employee.first_name;


                   
/*Write a query to display the department name and the number of managers in
the department. Display the records sorted in ascending order based on
department name. Give an alias to the number of managers as
manager_count.(Q15)*/
select  department.name ,count(employee.id)as number_manager from employee
inner join department on employee.department_id=department.id 
inner join manager on employee.id=manager.employee_id
group by  department.name;
/*Write a query to display the names of departments that have multiple
managers. Display the records sorted in ascending order based on department
name.(Q16).*/
select department.name,count(department.id)as multiple_manager from employee inner join department on
employee.department_id=department.id inner join manager 
on  manager.department_id=department.id
group by department.name 
having count(department.id) >1 ;
/*Write a query to display the first name of all employees who are
managers. Display the records sorted in ascending order based on first
name.(Q17)*/
select first_name from employee inner join manager on employee.id=manager.employee_id
order by employee.first_name;
/*Write a query to display the region name and the number of
departments in each region. Display the records sorted in ascending
order based on region name. Give an alias to the number of
departments as department_count. Display only the region names that
have atleast one department located in it.(Q18)*/
select region.name ,count(department.id)as department_count from region inner join countries on countries.region_id=region.id
inner join location on location.country_id=countries.id 
inner join department on location.id=department.location_id
group by region.name 
having count(department.id)>=1
order by region.name ;
/*Write a query to display the country name and the number of departments in
each country.Display the records sorted in ascending order based on country
name.Give an alias to the number of departments as department_count.
Display only the country names that have atleast one department located in
it.(Q19).*/
select countries.name,count(department.id)as department_count from countries inner join location on countries.id=location.country_id
inner join department on location.id=department.location_id
group by countries.name
having count(department.id) >=1
order by countries.name;

select * from location;
select*from countries;
select*from region;
select *from department;
select to_number(salary,'99G999D99') from employee;
select * from manager;

