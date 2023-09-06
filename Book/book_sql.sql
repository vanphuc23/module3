create database if not exists table_book;
use table_book;

create table if not exists Book(
book_id int primary key auto_increment,
book_name varchar(255) not null unique,
author varchar(255) not null,
describe_book text,
quantity_book int not null
);

create table if not exists Student(
student_id int primary key auto_increment,
student_name varchar(255) not null,
class varchar(25) not null
);

create table if not exists Book_card(
book_card_id varchar(50) primary key unique,
book_id int not null,
foreign key(book_id) references Book(book_id),
student_id int not null,
foreign key(student_id) references Student(student_id),
status bit not null,
start_day date not null,
end_day date not null
);

insert into Book(book_name, author, describe_book, quantity_book)
values('A', 'Nguyễn Văn A', 'good', 1), ('B', 'Nguyễn Văn B', 'good', 0);

insert into Student(student_name, class) 
values('Nguyễn Văn C', '12A1'), ('Nguyễn Văn D', '11D6'), ('Nguyễn Văn E', '12E3');

select * from Student;
select * from Book;