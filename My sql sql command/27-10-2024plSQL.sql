create table product
(pid tinyint, pname varchar(10), quantity tinyint);

insert into product values (1,'Laptop',30);
select * from product;
update product set quantity = 12 where pid = 1;
update product set quantity = 10 where pid = 1;

delimiter //
create trigger before_product_update
before update on product
for each row
begin
	if new.quantity <=10 then 
		set new.quantity = 30;
	end if;
end;