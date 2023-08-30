package repository;

import model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> display();
    void save(Student student);
    void deleteById(int id);
    Student findById(int id);
    void update(Student student);
}
