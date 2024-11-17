use main_tables;

select * from customers;
select * from orders;
select * from orderdetails;
select * from payments;


/*List customer details who do not place any order*/
select customerName,customerNumber from customers where customerNumber in 
(select customerNumber from customers except  select customerNumber from orders);

select customerName,customerNumber from customers where customerNumber not in (select customerNumber from orders);

select c.customerName,c.customerNumber from customers  c left join orders o on c.customerNumber = o.customerNumber where o.orderNumber is null;


/*List customer details whose payment amount greater than 30000 and 
creditlimit less than 70000 */
/*subquery is returning 15 rows but after running the outerquering it is returning 14 rows because 209 is being repeated*/
select customerName,customerNumber from customers where customerNumber in 
(select c.customerNumber from customers c join payments p 
on c.customerNumber = p.customerNumber 
where p.amount>30000 and c.creditLimit < 70000);


/*List customer details with order date between '2003-01-15' to '2004-01-15'*/
/*Without distinct kiya to 112 rows aayega and distinct se l=kiya to 75 kyuki ek customer ne bahut order kiye honge */
select distinct c.customerNumber from customers c join orders o 
on c.customerNumber = o.customerNumber
where o.orderDate Between "2003-01-15" and "2004-01-15";


select * from customers where customerNumber in
(select customerNumber from orders where orderDate Between "2003-01-15" and "2004-01-15");


/* List customer details with status as shipped and customername contains 'gift' */

select c.customerNumber,c.customerName from customers c where customerName like '%Gift%';
select o.customerNumber from orders o where status = 'Shipped';

/*Using join */
select c.customerNumber,c.customerName from customers c join orders o 
on c.customerNumber = o.customerNumber
where o.status = 'Shipped' and c.customerName like '%Gift%'

/*using natural  join */
/*issme bhi bahut log ne baar baar order diya hai to with and without distinct rows ka ans change hoga */
select  distinct c.customerNumber,c.customerName from customers c natural join orders o 
where o.status = 'Shipped' and c.customerName like '%Gift%';


/*Count credit limit which is greater than zero*/
select count(creditLimit) totalCreditLimit from customers where creditLimit >0;

select sum(creditLimit) totalCreditLimit from customers where creditLimit > 0;

 /*Display employee details whose office is in 'USA'*/
 select * from employees e join offices o on e.officeCode = o.officeCode where country = 'USA'; 
 select * from employees where officeCode in (select officeCode from offices where country = 'USA');
 
  /*Ordernumber wise count the product code*/
  /*using join */
  select o.orderNumber,count(od.productCode) as TotalProductCode from orders o 
  join orderdetails od
  on od.orderNumber = o.orderNumber
 group by o.orderNumber order by o.orderNumber;
/*Agar kuch aur cheez chaiye to yeh niche wali query nahi chalegi kyuki orderNumber orders se aa raha hai */
select orderNumber ,count(productCode) as total from orderdetails group by orderNumber order by orderNumber;
  /*using natural join */
select o.orderNumber,count(od.productCode) as TotalProductCode from orders o natural join orderdetails od 
 group by o.orderNumber order by o.orderNumber;
 
 