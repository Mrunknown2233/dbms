use main_tables;


/* customer's name who have ordered Honda Civic */
/*This can be done with both sub query and join too */
/*List customers details who have placed order & whose product name is '1995 Honda Civic'*/


select * from customers where customerNumber in 
(select customerNumber from orders where orderNumber in
(select orderNumber from orderdetails where productCode in
(select productCode from products where 
productName = '1995 Honda Civic')));



/*Using join */
/* Join meh final output meh no of tuples ane ke chances zyada hai kyuki subquery inner se outer query   meh jane ke liye ek hi value dega mtlb repeated values nahi honge 
but join meh non distinct values aayenge*/
select distinct c.customernumber,p.productname from
customers c,orders o,orderdetails od,products p 
where c.customerNumber = o.customerNumber and
o.orderNumber=od.orderNumber and
od.productCode = p.productCode and 
p.productName = '1995 Honda Civic'
order by customerNumber;