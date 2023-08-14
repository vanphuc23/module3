package com.example.abc.service;

import com.example.abc.model.Student;
import com.example.abc.repository.IStudentRepository;
import com.example.abc.repository.StudentRepository;

import java.util.ArrayList;

public class StudentService implements IStudentService{
    private IStudentRepository iStudentRepository=new StudentRepository();
    @Override
    public ArrayList<Student> display() {
        return iStudentRepository.findAll();
    }
}
