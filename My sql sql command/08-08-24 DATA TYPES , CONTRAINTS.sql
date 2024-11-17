create table test
( 
roll_no tinyint unsigned primary key,name varchar(20)
);
use dbms;

create table test2
(
	Cno tinyint unsigned unique,
    name varchar(20)
);
select * from test;
select * from test2;



insert into test values
(
	1,'Soumya'
);
insert into test values(2,'Dhyaan');
insert into test values(3,'Smit');
insert into test values(4,'Nikunj');


insert into test2 values(1,'DS');
insert into test2 values(2,'OOP');
insert into test2 values(3,'DBMS');
insert into test2 values(4,'DTE');


create table test3
(
	stud_no tinyint unsigned, c_no tinyint unsigned,
    primary key(stud_no,c_no),
    foreign key (stud_no) references test (roll_no),
    foreign key (c_no) references test2(cno)
);

select * from test3
insert into test3 values
(1,1) ,
(1,2),
(1,3),
(2,2),
(2,3),
(3,3);

insert into test3 values (3,5); /* error de raha hai kyuki 5 no ka course parent table meh nahi hai */

delete from test where roll_no =1;    /*error dega kyuki  child meh yeh referr kar rha hai to delte nahi kar sakta hai 
										agar karna hai to sab jagah child meh jaha hai vaha se hatana padega phele */
delete from test3 where stud_no =3;

delete from test2 where cno = 3;/*error dega kyuki  child meh yeh referr kar rha hai to delte nahi kar sakta hai 
										agar karna hai to sab jagah child meh jaha hai vaha se hatana padega phele */
                                        
delete from test where roll_no =3; /* child table ki sari entries delete hogai so no error aaram se delete karenge kyuki parent ka value child
									child meh nahi mila */
                                    
                                    
                                    
create table student
( 
roll_no tinyint unsigned primary key,name varchar(20)
);
use dbms;
/*on delete cascade*/
create table course
(
	Cno tinyint unsigned unique,
    name varchar(20)
);



insert into student values
(
	1,'Soumya'
);
insert into student values(2,'Dhyaan');
insert into student values(3,'Smit');


insert into course values(1,'DS');
insert into course values(2,'OOP');
insert into course values(3,'DBMS');
insert into course values(4,'DTE');




create table enroll
(
	stud_no tinyint unsigned, c_no tinyint unsigned,
    primary key(stud_no,c_no),
    foreign key (stud_no) references student (roll_no) on delete cascade,
    foreign key (c_no) references course (cno) on delete cascade
);

insert into enroll values
(1,1) ,
(1,2),
(1,3),
(2,2),
(2,3),
(3,3);

delete from student where roll_no = 3; /*Idhar delete kr sakte   hai kyuki vo " on delete cascade " command se agar parent se delete hua to har child se delete hoga*/
delete from course where cno = 3;


select * from enroll;

/* ek hi table meh foreign key

name =  test 4
	attribute = eno tinyint unsigned primary key,
    attri name varhcar(20),
    attri mno tinyint unsigned,
    
    
    foreign key (mno) referreces test4 (eno) on delete casecade
    entries
    101=101
    102=101
    103=102
    
    
    
*/

create table test4
(
	eno tinyint unsigned primary key, 
	name varchar (20),
    mno tinyint unsigned ,
    foreign key (mno) references test4 (eno) on delete cascade /* on delete set null (jo value parent se delete hoga to jaha vo data hoga child table meh vaha null de de*/
    
);

select * from test4;
insert into test4 values (101,'Soumya',101),(102,'Nikunj',101),(103,'Dhyaan',102);

delete from test4 where eno = 101; /* delete ek whole row hoga koi specific data nahi hogi delete specific value ke liye update use krna padega*/
   
   
   
   
create table emp 
( 
	eno tinyint primary key,
    name varchar(20) not null,
    phone bigint unsigned unique,
    dob date,
    age tinyint check (age>=18),
    gender varchar(6) check (gender = 'M' or gender = 'F'),
    date_of_joining date ,
    salary float default 40000,
    mno tinyint,
    foreign key (mno) references emp (eno) on delete set null
    );
    
    /*alter add*/
    alter table emp add email varchar (30) unique after phone;
    
    /*alter drop */
    alter table emp drop column dob;
    alter table emp drop  dob;
    
	/*alter modify */
    alter table emp modify gender char;
    
    /*alter rename */
    alter table emp rename column date_of_joining to doj;
    
    
    alter table emp add col varchar(90),
					modify doj varchar(80);
	alter table emp add primary key(doj),
					rename column doj to dateOfJoining;
                    
select * from emp;
insert into emp values (101,'Soumya',7020144565,'dedhiasoumya299@gmail.com',17,'m','2024-09-24',1000000,101);


insert into emp values (101,'Soumya',7020144565,'dedhiasoumya299@gmail.com',18,'M','2024-09-24',1000000,101);

delete from emp where eno =101;
insert into emp values (101,'Soumya',7020144565,'dedhiasoumya299@gmail.com',18,'M','2024-09-24',1000000,101),
						(102,'Nikunj',9029147561,'lord_nikunj@gmail.com',18,'M','2024-02-02',1000000,101),
                        (103,'Dhyaan',9823568374,'goatDSanghvi@gmail.com',18,'M','2024-09-22',1000000,102),
                        (104,'Smit',8903245789,'mehhutransmit@gmail.com',18,'M','2024-09-11',1000000,103);
                        
                        
                        
create table oyeee3
(
	who int ,
    who2 int,
    foreign key (who2) references oyeee3 (who)
    );
    
    
    
    
   /*shows the entire command create and also the constraint name*/ 
show create table emp;

/*aReanaming the table */
alter table emp rename emp1; // overall sab db meh nahi chalega 
select * from emp1;
rename table emp1 to emp;   // sab db meh chlta hai 
select * from emp;


/*drop primary key*/
alter table test3 drop primary key;

/*drop other constraints */
alter table test3 drop constraint test3_ibfk_1;
alter table test3 drop constraint test3_ibfk_2;

/*change default */
alter table emp modify salary float default null;

/*remove not null,set it to null */
alter table emp modify name varchar(20) null;

/*drop key on fk attb  special command */
alter table test3 drop key c_no;

/*add primary key */
alter table test3 add primary key(stud_no,c_no);


/*add foreign key */
alter table test3 add constraint studno_fk foreign key (stud_no) references test1 (roll_no) no delete cascade;
alter table test3 add constraint studno_fk foreign key (c_no) references test2 (Cno) no delete cascade;




