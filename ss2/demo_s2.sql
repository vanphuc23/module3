CREATE DATABASE demo_ss2;
USE demo_ss2;

create table class(
  id int primary key auto_increment, 
  name varchar(20)
);

create table jame(
  `account` varchar(50) primary key, 
  `password` varchar(50)
);
create table student(
  id int primary key auto_increment, 
  name varchar(50), 
  birthday date, 
  gender boolean, 
  email varchar(50), 
  `point` float, 
  class_id int, 
  `account` varchar(50) unique, 
  foreign key (class_id) references class(id), 
  foreign key (`account`) references jame(`account`),
  constraint CHK_student CHECK(`point`>5)
);
create table instructor(
  id int primary key auto_increment, 
  name varchar(50), 
  birthday date, 
  salary double
);
create table instructor_class(
  class_id int, 
  instructor_id int, 
  start_time date, 
  end_time date, 
  primary key (class_id, instructor_id), 
  foreign key(class_id) references class(id), 
  foreign key(instructor_id) references instructor(id)
);

insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');

insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');
 
insert into jame(`account`,`password`)
 value('cunnn','12345');

insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');

 
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);

 
 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
 
 select * from student where class_id>=1;

select * from student;
 
select * from student where (`name` like '%hai%' or `name` like '%huynh%');

select * from student where `point`>5;

select * from student where `name` like '%nguyen%';

select * from class;

select `point`, count(`name`) as "So Luong"
FROM student
GROUP BY `point`;

select `point`, count(`name`) as "So Luong"
FROM student where `point`>5
GROUP BY `point`;

select `point`,count(`name`) as "So Luong"
from student where `point`>5
group by `point`
having count(`name`) >=2;

select * from student where class_id=1
order by name;
-- 1
select c.`name`,count(s.`name`) as "So Luong" from student s 
join class c
on s.class_id=c.id
group by c.`name`;
-- 2
select c.`name`,max(s.`point`) as "Max" from student s 
join class c
on s.class_id=c.id
group by c.`name`;
-- 3
select c.`name`,avg(s.`point`) as "Max" from student s 
join class c
on s.class_id=c.id
group by c.`name`;
-- 4
select name,birthday from(
select name,birthday
from student
union all
select name,birthday
from instructor
) as Name_Birthday;
-- 5
select `name`,`point` 
from student
order by `point` desc
limit 3; 
-- 6
select *
from student 
where point=(select max(point)
              from student);

-- LENGTH, CHAR_LENGTH, MONTH(), YEAR(), SUBSTRING()…
-- DATEDIFF() CURDATE
-- https://www.w3schools.com/sql/sql_ref_mysql.asp

-- 1. Mục đích khi sử dụng INDEX? Một số hạn chế khi sử dụng INDEX?

-- 2. Mục đích sử dụng VIEW? Chú pháp tạo VIEW?

-- 3. Sử dụng SP dùng để làm gì? Cú pháp tạo SP?

-- 4. Sử dụng Trigger dùng để làm gì?

-- 5. Sử dụng Function dùng để làm gì?

-- Thực hiện các yêu cầu dưới đây:
-- 1. Tạo 1 Store Procedure có tên findByName với tham số truyền vào là name để tìm các record 
-- 2. Tạo 1 Trigger tự động tạo tài khoản jame trước khi thêm mới một học viên
-- 3. Viết function xếp loại học lưc theo point. >= 8 là loại giỏi, >= 6 là khá  còn lại là yếu,











