package service;

import model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> display();
    void save(Student student);
    void deleteById(int id);
    Student findById(int id);
    void update(Student student);
}
