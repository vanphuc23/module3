create database if not exists product_list;
use product_list;

create table if not exists Category (
id int primary key auto_increment,
type varchar(255) not null
);

create table if not exists Product(
id_product int primary key auto_increment,
name text not null,
price double not null,
number int not null,
color varchar(255) not null,
mota text,
id int not null,
foreign key(id) references Category(id)
);

insert into Category(type)
values ('Phone'), ('Television');

insert into Product(name, price, number, color, mota, id) 
values ('iPhone 11', 799, 12, 'Purple, Yellow, Green', 'OK', 1);

select p.*, c.type from Product p join Category c on p.id=c.id where p.id_product=2;

select * from Product;

select * from Category where id != ?;

select p.*, c.type from Product p join Category c on p.id=c.id where p.name like ?;