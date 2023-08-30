create database if not exists demo;
use demo;

create table if not exists users (
 id  int NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

insert into users(name, email, country)
values();

select * from users;

delimiter //
create procedure find_by_id(id int)
begin
select * from users u where u.id = id;
end //

delimiter ;

call find_by_id(1);

delimiter //
create procedure update_by_id(id_old int, new_name varchar(120), new_email varchar(220), new_country varchar(120))
begin
update users set name = new_name, email = new_email, country = new_country where (id = id_old);
end //

delimiter ;

delimiter //
create procedure delete_by_id(id_delete int)
begin
delete from users where (id = id_delete);
end //

delimiter ;

call delete_by_id(8);

delimiter //
create procedure search_by_country(country_search varchar(50))
begin
select * from users where country like country_search;
end //

delimiter ;

select * from users 
order by substring_index(name,' ',-1);	

delimiter //
create procedure add_user() 
begin

declare exit handler for sqlexception rollback;

start transaction;

insert into users(name, email, country) values ('P','p@gmail.com','đn');
insert into users(name, email, country) values ('P','p@gmail.com',1,1);
commit;
end //

delimiter ;

call add_user();