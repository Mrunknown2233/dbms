use dbms;

create table test5(eid smallint primary key, 
ename varchar(20));
insert into test5 values
(101,'Chahat'),
(102,'Vedanshi'),
(103,'Yash');
select * from test5;

create table test6(eno smallint primary key,
salary float,
foreign key (eno) references test5 (eid) on delete cascade);
insert into test6 values
(101,50000),
(102,51000),
(103,52000);
select * from test6;

create table employee(eid smallint primary key, 
ename varchar(20), city varchar(20), dno smallint,
foreign key (dno) references department (dno) on delete set null);
insert into employee values
(101,'Chahat','Mumbai',10),
(102,'Vedanshi','Pune',20),
(103,'Yash','Delhi',30),
(104,'Palak','Pune',20),
(105,'Soumya','Mumbai',10),
(106,'Mannat','Delhi',30),
(107,'Vanshika','Mumbai',10);
insert into employee (eid, ename, city)
values (108,'Raj','Banglore');
select * from employee;

create table employee_sal(eid smallint primary key,
salary float,
foreign key (eid) references employee (eid) on delete cascade);
insert into employee_sal values
(101,50000),
(102,51000),
(103,52000),
(104,53000),
(105,54000),
(106,55000),
(107,56000);
select * from employee_sal;

create table department 
(dno smallint primary key,
dname varchar(20));
insert into department values
(10,'Sales'),
(20,'Admin'),
(30,'Research'),
(40,'Production');
select * from department;





/*Types of Join */

/*Join / Inner Joint */
select * from test5 as a join test6 as b on a.eid=b.eno;

select * from test5 as a inner join test6 as b on a.eid=b.eno;


/*Cross Join */

/*Wrong syntax */
select * from test5 as a ,test6 as b on a.eid=b.eno;

/*Correct syntax */
select * from test5 as a,test6 as b where a.eid=b.eno;


/*Natural Join*/
/*attribute name is differemt as a result the natural join works as a cross join */
select * from test5 natural join test6;

select * from employee join employee_sal;

/*attribute name is similar*/

select * from employee natural join employee_sal;

/* Self Join */

/*display ename who live in same city as of Chahat  exclusive of Chahat's name */
select e1.ename from employee e1,employee e2 where 
e2.ename = 'Chahat' and e2.city = e1.city and e1.ename!=e2.ename;  /* e1.ename != 'Chahat';*/

/* Same solution with subquery*/

select ename from employee where city in 
(select city from employee where ename = 'Chahat') and ename !='Chahat';
use dbms;
/*Outer Join */
/*Left Join */
select * from employee as e left join department as d on e.dno = d.dno;

select * from employee as e left  outer join department as d on e.dno = d.dno;

/*Right Join */

select * from employee as e right join department as d on e.dno = d.dno;

select * from employee as e right outer join department as d on e.dno = d.dno;


/*Full outer join */
/*Not supported by mySQL*/
select * from employee as e full join department as d on e.dno = d.dno;

select * from employee as e full outer join department as d on e.dno = d.dno;

/*Instead of full join - here use union */
select * from employee as e left outer join department as d on e.dno = d.dno
union
select * from employee as e right outer join department as d on e.dno = d.dno;

/*now in main_tables*/
