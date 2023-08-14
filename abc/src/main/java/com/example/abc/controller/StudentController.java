package com.example.abc.controller;

import com.example.abc.model.Student;
import com.example.abc.service.IStudentService;
import com.example.abc.service.StudentService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
@WebServlet(name = "student", value = "")
public class StudentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IStudentService iStudentService=new StudentService();
        ArrayList<Student> list=iStudentService.display();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher =request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request,response);
    }
}
