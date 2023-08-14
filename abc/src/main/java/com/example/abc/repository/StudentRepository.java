package com.example.abc.repository;

import com.example.abc.model.Student;

import java.util.ArrayList;

public class StudentRepository implements IStudentRepository{
    static ArrayList<Student> arrayList = new ArrayList<>();
    static {
        arrayList.add(new Student("Nguyễn Văn A",8,"ĐN"));
        arrayList.add(new Student("Nguyễn Văn B",9,"QN"));
        arrayList.add(new Student("Nguyễn Văn C",10,"HN"));
    }
    @Override
    public ArrayList<Student> findAll() {
        return arrayList;
    }
}
