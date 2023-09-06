create database if not exists Household_management;
use Household_management;

create table if not exists household(
household_id int primary key auto_increment,
household_code varchar(25) not null unique,
household_name varchar(255) not null,
number int not null,
household_date date not null,
address text not null
);

create table if not exists member(
member_id int primary key auto_increment,
name varchar(255) not null,
cmnd varchar(255) unique,
birthday date,
household_id int not null,
foreign key(household_id) references household(household_id)
);

insert into household(household_code, household_name, number, household_date, address)
values ('HK-001', 'Nguyễn Văn A', 3, '2016-08-07', 'K12/123 Nguyễn Tất Thành');

insert into household(household_code, household_name, number, household_date, address)
values ('HK-112', 'Nguyễn Văn C', 2, '2019-08-10', '8 Hùng Vương');

select * from household;

select * from member;

insert into member(name, household_id)
values ('Nguyễn Văn B', 1), ('Nguyễn Văn C', 1), ('Nguyễn Văn D', 1);

insert into member(name, household_id)
value ('Nguyễn Văn D', 2);

select m.name, h.household_id from household h join member m on m.household_id = h.household_id where m.household_id=1;