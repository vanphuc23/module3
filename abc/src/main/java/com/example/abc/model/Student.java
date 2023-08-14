package com.example.abc.model;

public class Student {
    private String name;
    private double score;
    private String address;

    public Student() {
    }

    public Student(String name, double score, String address) {
        this.name = name;
        this.score = score;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
