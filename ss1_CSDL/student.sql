CREATE TABLE student(
id int primary key auto_increment,
name varchar(50),
date_of_birth date,
address varchar(255),
gender bit
);

INSERT INTO student(`name`,date_of_birth,address,gender)
VALUES("NVP","2003-01-01","Đà Nẵng",0),
("Ngân","2003-08-19","America",1);

SELECT * FROM student;

UPDATE student
SET gender=1
WHERE(`id`=2);

DELETE FROM student
WHERE(`id`=1);

ALTER TABLE student
ADD hg varchar(255);


