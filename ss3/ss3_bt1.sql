create database bt_ss3_1;
use bt_ss3_1;

create table Class(
ClassID int not null primary key auto_increment,
ClassName varchar(50) not null,
StartDate date not null, 
`Status` bit
);

create table Student(
StudentID int not null primary key auto_increment,
StudentName varchar(50) not null,
Address varchar(50),
Phone varchar(50),
`Status` bit,
ClassID int not null,
foreign key(ClassID) references Class(ClassID) 
);

create table Subject(
SubID int not null primary key auto_increment,
SubName varchar(20) not null,
Credit tinyint not null default 1 
check (credit>=1),
Status bit default 1
);

create table Mark(
MarkID int not null primary key auto_increment,
SubID int not null,
StudentID int not null,
Mark float default 0
check(Mark between 0 and 100),
ExamTimes tinyint default 1,
unique(SubID,StudentID),
foreign key(SubID) references Subject(SubID),
foreign key(StudentID) references Student(StudentID)
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from Student
where substring_index(StudentName," ",-1) like "h%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from Class
where month(StartDate)=12;


-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from Subject
where Credit>=3 and Credit <=5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update Student 
set ClassID=2
where(StudentID=1);

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.StudentName,su.SubName,m.Mark from Student s
join Mark m
on s.StudentID= m.StudentID
join Subject su
on m.SubID=su.SubID
order by m.Mark desc, s.StudentName asc;

