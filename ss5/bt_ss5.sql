create database if not exists bt_ss5_1;
use bt_ss5_1;

create table if not exists Products(
id int primary key auto_increment not null,
productCode int not null,
productName varchar(50) not null,
productPrice double not null,
productAmount double not null,
productDescription varchar(50) not null,
productStatus bit
);

insert into Products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
values (1,'Bánh',5.000,2,'Ngon',1),(2,'Kẹo',2.000,5,'Ngọt',1);

select* from Products;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_Products_productCode 
on Products(productCode);


-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_Products_productName_productPrice 
on Products(productName,productPrice);


-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select productName,productPrice from Products where productPrice=2.000 and productName='Kẹo';

explain select productCode from Products where productCode=2;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_Products 
as select productCode, productName, productPrice, productStatus
from Products;

select * from view_Products;

-- Tiến hành sửa đổi view
update view_Products 
set productName='pepsi'
where(productCode=2);

-- Tiến hành xoá view
drop view view_Products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure product()
begin
select * from Products;
end //

delimiter ;

call product();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_new_product(new_productCode int,new_productName varchar(50),new_productPrice double,new_productAmount double,new_productDescription varchar(50),new_productStatus bit) 
begin
insert into Products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
value (new_productCode,new_productName,new_productPrice,new_productAmount,new_productDescription,new_productStatus);
end //

delimiter ;

call add_new_product(4,'Coca',10.000,3,'Ngon',1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure fix_id(in id2 int, in new_productName varchar(50), in new_productPrice double)
begin
update Products
set productName=new_productName, productPrice=new_productPrice
where(id=id2);
end //

delimiter ;

call fix_id(6,'Coca',10.000);

drop procedure fix_id;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_id(in id2 int)
begin
delete from Products
where(id=id2);
end //

delimiter ;

call delete_id(18);

drop procedure delete_id;