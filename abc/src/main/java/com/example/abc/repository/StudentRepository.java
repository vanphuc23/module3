package com.example.abc.repository;

import com.example.abc.model.Student;

import java.util.ArrayList;

public class StudentRepository implements IStudentRepository{
    static ArrayList<Student> arrayList = new ArrayList<>();
    static {
        arrayList.add(new Student("Nguyễn Văn A",8,"https://statics.vinpearl.com/du-lich-da-nang_1657939501.JPG"));
        arrayList.add(new Student("Nguyễn Văn B",9,"https://statics.vinpearl.com/du-lich-da-nang_1657939501.JPG"));
        arrayList.add(new Student("Nguyễn Văn C",10,"https://statics.vinpearl.com/du-lich-da-nang_1657939501.JPG"));
    }
    @Override
    public ArrayList<Student> findAll() {
        return arrayList;
    }
}
