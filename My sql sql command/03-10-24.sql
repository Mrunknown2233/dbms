/*==================Pls use Main_table ===========================*/
use main_tables;

select * from customers;
desc customers;
/*Primary key ke liye by defauly index banta hai so explain meh jb rows wala column dekhenge to 1 hi aayega*/
select * from customers where customerNumber = 103;
explain select * from customers where customerNumber = 103;

show create table customers;

/*agar normal column rahega to usske liye explicitly index banana hoga */
select * from customers where country = 'USA';
explain select * from customers where country = 'USA';

select * from customers where customerName = 'Signal Gift Stores';
explain select * from customers where customerName = 'Signal Gift Stores';

/*Single column Index*/
create index ind_cust_country on customers(country);
select * from customers where country = 'USA';
explain select * from customers where country = 'USA';

/*======PLS USE DBMS DATA BASE====*/
use dbms;

create unique index uni_ind_test_name on  test1 (name);
desc test1;
show create table test1;
insert into test1 values (8,null,'Mumbai',86936);
drop index uni_ind_test_name on test1;


/*Multiple column Unique index */
/*only the index for no will be created 
i.e whenever a composite index is created 
the index will be for the leftMost attribute in the roundBraces()*/
create unique index uni_ind_test_no_name on test1 (no,name);

explain select * from test1 where name = 'Soumya';/*zyada row check karega*/
explain select * from test1 where no = '7';/*ek hi check karega*/

update test1 set name = 'Soumya' where no = 8;

/*ek hi check karega kyuki no bhi include kiya hai */
explain select * from test1 where no = 2  and name ='Soumya';

/*==================Pls use Main_table ===========================*/
use main_tables;
/*concat()*/
select concat(contactfirstname,contactlastname) from customers;
select concat(contactfirstname,' ',contactlastname) from customers;

/*from dual*/
select concat('Pratik','Sanghvi') from dual;

/*length function*/
select concat(contactfirstname,contactlastname),length(concat(contactfirstname,contactlastname)) from customers;

/*trim*/
select concat(contactfirstname,contactlastname),length(concat(trim(contactfirstname),trim(contactlastname))) from customers;
select ltrim('  Soumya Dedhia') from dual;
select rtrim('Soumya Dedhia   ') from dual;


/*AScii*/
select ascii('A') from dual;

/*replace*/
select replace('Hello','ell','ar');

/*reverse*/
select reverse('madam') from dual;
select reverse('hello') from dual;

/*Substring*/
select substr('Pratik Sanghvi',8,8) from dual;
select substring('Pratik Sanghvi',8,8) from dual;

/*left substring*/
select left('Pratik Sanghvi',6) from dual;
select right('Pratik Sanghvi',9) from dual;

/*upper case */
select upper('soumya dedhia ') from dual;

/*Lower case*/
select lower('SOUMYA DEDHIA') from dual;

/*Lpad and Rpad*/
select lpad('Soumya',10,'+');
select rpad('Soumya',10,'+');


/*==================Pls use dbms ===========================*/
/*date n time functions*/
use dbms;
select curdate() from dual;
select curtime() from dual;
select now() from dual;
select last_day(curdate()) from dual;
select extract(year from curdate()) from dual;
select extract(month from curdate()) from dual;
select extract(day from curdate()) from dual;
select week(curdate()) from dual;
select week('2024-01-01') from dual;
select name,floor(datediff(curdate(),dob)/365)from stud;

/*Monday =0.......Sunday = 6*/
select weekday(curdate()) from dual;
select weekday('2024-10-06') from dual;
/*Sunday = 1 .......Saturday =7 */
select dayofweek(curdate()) from dual;
/*returns the name of the week day */
select dayname(curdate()) from dual;


/*numeric function*/
select floor(24.11) from dual;
select ceil(24.11) from dual;
select abs(-2411) from dual;
select mod(9,4) from dual;
select power(2,3) from dual;
select sqrt(9) from dual;
select round(92759.7375,3);
select truncate(92759.7375,3);
select ln(2.71828182);
select exp(1) from dual;
