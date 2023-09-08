select * from student;
insert into student(name, gender, point)
values('A', 1, 6), ('B', 0, 7), ('C', 1, 8), ('D', 0, 9);

delimiter //
create procedure delete_by_id(id_delete int)
begin 
delete from student where id=id_delete;
end //

delimiter ;

call delete_by_id(1);

delimiter //
create procedure update_by_id(id_update int, new_name varchar(50), new_gender bit, new_point double)
begin
update student set name = new_name, gender = new_gender, point = new_point
where id = id_update;
end //

delimiter ;

call update_by_id(1, 'E', 1, 10);

delimiter //
create procedure find_by_id(id int)
begin
select * from student st
where st.id=id;
end //

delimiter ;

call find_by_id(1);

delimiter //
create procedure update_student(id_student int, new_name varchar(50), new_gender bit, new_point double)
begin
update student set name = new_name, gender = new_gender, point = new_point 
where id = id_student;
end //

delimiter ;

call update_by_id(1, 'Q', 1, 10);


