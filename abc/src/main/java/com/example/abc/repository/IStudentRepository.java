package com.example.abc.repository;

import com.example.abc.model.Student;

import java.util.ArrayList;

public interface IStudentRepository {
    ArrayList<Student> findAll();
}
