use main_tables;


select ordernumber,quantityordered *priceeach as total from orderdetails;
/*Display customername & ordernumber -ordernumberwise total */
select customername,o.ordernumber,sum(quantityordered *priceeach) as Total
from customers c, orders o, orderdetails od
where c.customerNumber = o.customerNumber and
o.orderNumber = od.orderNumber
group by o.orderNumber
order by total desc
limit 10;

/*PLSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS  SELECT DBMS AS THE SCHEMAAAAAAAAAAAAAAAA */

use dbms;
create table stud(name varchar(20), dob date);

insert into stud values('Chahat','2004-01-01');
insert into stud values('Vedanshi','2004-02-01');
insert into stud values('Yash','2005-03-01');
insert into stud values('Palak','2006-04-01');
insert into stud values('Soumya','2007-05-01');

select * from stud;

create table cust_acc(name varchar(20), accno varchar(20));
insert into cust_acc values
('Jeevika','A101'),
('Kirti','A102'),
('Hemant','A103'),
('Joy','A104'),
('Sahil','A105');
select * from cust_acc;

create table cust_loan(name varchar(20), loanno varchar(20));
insert into cust_loan values
('Jeevika','L201'),
('Kirti','L202'),
('Hemant','L203'),
('Sahil','L204');
select * from cust_loan;


/*Union - display name who have a account or loan or both */
select name from cust_acc union
select name from cust_loan;

/*Union all */
select name from cust_acc union all select name from cust_loan;

/*Intersect- dispaly name who have both account as well as loan*/
select name from cust_acc intersect select name from cust_loan;

/*Intersect using logic of sub query */
select name from cust_acc where name in (select name from cust_loan);

/*Intersect logic using join*/
select a.name from cust_acc a join cust_loan l on a.name = l.name;

/*not supported by many dbs*/
select name from cust_acc minus select name from cust_loan;

/*Except- display name who have only account */
select name from cust_acc except select name from cust_loan;

/*Except logic using subquery */
select name from cust_acc where name not in (select name from cust_loan);

/*Except logic using join */
select a.name from cust_acc a left join cust_loan l on a.name = l.name where l.loanno is  null;

