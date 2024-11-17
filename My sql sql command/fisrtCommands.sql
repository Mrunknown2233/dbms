create database dbms;
use dbms;
create table test
(no int,
name varchar(20),
city varchar(20),
phone int
);


insert into test values(1,'Palak','Mumbai',98301); //use to insert a single tuple at once
insert into test values
(2,'Soumya','Delhi',99583),
(3,'Hanish','Pune',99889),
(4,'Nikunj','Banglore',09878);


select no,name,city,phone from test;
select * from test; 
select no,name from test;


desc test;

insert into test values (6,'Janavi','Pune'); // gives error

insert into test  (no,name,city)
values(6,'Janavi','Pune');


insert into test(name,city,no,phone)
values ('Harsh','Mumbai',5,67575);

update test city = 'Mumbai';
insert into test values 
(7,'Krish','mumbai',79375);


select * from test where city = 'Mumbai';

insert into test values (8,'Pratik','Pune',98959);

delete from test; // pura table meh jitna data hai sab udega.
delete from test where no = 8;

select * from test where phone = null \\yeh error dega kyuki null asie compare nahi hoga
select * from test where phone is null;