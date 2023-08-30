create database if not exists casestudy_2;
use casestudy_2;

create table if not exists position (
position_id int primary key auto_increment,
position_name varchar(45)
);

create table if not exists education_degree(
education_degree_id int primary key auto_increment,
education_degree_name varchar(45)
);

create table if not exists division(
division_id int primary key auto_increment,
division_name varchar(45)
);

create table if not exists role(
role_id int primary key auto_increment,
role_name varchar(255)
);

create table if not exists user(
username varchar(255) primary key unique,
password varchar(255)
);

create table if not exists user_role(
role_id int not null,
username varchar(255) not null,
foreign key(role_id) references role(role_id),
foreign key(username) references user(username)
);

create table if not exists employee(
employee_id int primary key auto_increment,
employee_name varchar(45) not null,
employee_birthday date not null,
employee_id_card varchar(45) not null,
employee_salary double not null,
employee_phone varchar(45) not null,
employee_email varchar(45),
employee_address varchar(45),
position_id int not null,
education_degree_id int not null,
division_id int not null,
username varchar(255),
foreign key(position_id) references position (position_id),
foreign key(education_degree_id) references education_degree(education_degree_id),
foreign key(division_id) references division(division_id),
foreign key(username) references user(username)
);

create table if not exists customer_type(
customer_type_id int primary key auto_increment,
customer_type_name varchar(45)
);

create table if not exists customer(
customer_id int primary key auto_increment,
customer_type_id int not null,
foreign key(customer_type_id) references customer_type(customer_type_id),
customer_name varchar(45) not null,
customer_birthday date not null,
customer_gender bit(1) not null,
customer_id_card varchar(45) not null unique,
customer_phone varchar(45) not null unique,
customer_email varchar(45) unique,
customer_address varchar(45)
);

create table if not exists service_type(
service_type_id int primary key auto_increment,
service_type_name varchar(45)
);

create table if not exists rent_type(
rent_type_id int primary key auto_increment,
rent_type_name varchar(45),
rent_type_cost double
);

create table if not exists service(
service_id int primary key auto_increment,
service_name varchar(45) not null,
service_area int,
service_cost double not null,
service_max_people int,
rent_type_id int not null,
foreign key(rent_type_id) references rent_type(rent_type_id),
service_type_id int not null,
foreign key(service_type_id) references service_type(service_type_id),
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int
);

create table if not exists attach_service(
attach_service_id int primary key auto_increment,
attach_service_name varchar(45) not null,
attach_service_cost double not null,
attach_service_unit int not null,
attach_service_status varchar(45)
);

create table if not exists contract(
contract_id int primary key auto_increment,
contract_start_date datetime not null,
contract_end_date datetime not null,
contract_deposit double not null,
contract_total_money double not null,
employee_id int not null,
foreign key(employee_id) references employee(employee_id),
customer_id int not null,
foreign key(customer_id) references customer(customer_id),
service_id int not null,
foreign key(service_id) references service(service_id)
);

create table if not exists contract_detail(
contract_detail_id int primary key auto_increment,
contract_id int not null,
foreign key(contract_id) references contract(contract_id),
attach_service_id int not null,
foreign key(attach_service_id) references attach_service(attach_service_id),
quantity int not null
);

insert into position (position_name) 
values ('Lễ tân'), ('Phục vụ'), ('Chuyên viên'), ('Giám sát'), ('Quản lý'), ('Giám đốc');

insert into education_degree(education_degree_name)
values ('Trung cấp'), ('Cao đẳng'), ('Đại học'), ('Sau đại học');

insert into division(division_name)
values ('Sale – Marketing'), ('Hành Chính'), ('Phục vụ'), ('Quản lý');

insert into customer_type(customer_type_name) 
values ('Diamond'), ('Platinium'), ('Gold'), ('Silver'), ('Member');

insert into customer(customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card,
                     customer_phone, customer_email, customer_address)
values (1, 'Nguyễn Văn A', '2000-12-2', 1, '098765432', '0901234567', 'a@gmail.com', 'Âu Cơ'),
      (2, 'Nguyễn Văn B', '2000-11-5', 0, '098765433', '0910234568', 'b@gmail.com', 'Lê Duẩn'),
      (3, 'Nguyễn Văn C', '2001-9-12', 1, '098765434628', '0901234569', 'c@gmail.com', 'Đồng Kè'),
      (4, 'Nguyễn Văn D', '1995-4-23', 0, '098765435', '0901234560', 'd@gmail.com', 'Thanh Vinh'),
      (5, 'Nguyễn Văn E', '1996-1-29', 1, '039361950361', '0910234557', 'e@gmail.com', 'Lạc Long Quân');
      