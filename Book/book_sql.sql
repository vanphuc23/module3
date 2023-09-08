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
id int primary key auto_increment,
book_card_id varchar(50) not null,
book_id int not null,
foreign key(book_id) references Book(book_id),
student_id int,
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
select * from Book_card;

select bc.id, bc.book_card_id, b.book_id, b.book_name, b.author, b.quantity_book, s.student_name, s.class, bc.status, bc.start_day, bc.end_day 
from Book b join Book_card bc on b.book_id = bc.book_id
join Student s on s.student_id = bc.student_id where b.book_name like '%a%' and s.student_name like '%a%';