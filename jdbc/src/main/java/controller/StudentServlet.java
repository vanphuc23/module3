package controller;

import model.Student;
import service.IStudentService;
import service.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/students")
public class StudentServlet extends HttpServlet {
    private IStudentService iStudentService = new StudentService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if(action==null) {
            action="";
        }

        switch (action) {
            case "showCreate":
                showCreate(request,response);
                break;
            case "showUpdate":
                showUpdate(request,response);
                break;
            default:
                ShowListStudent(request,response);
                break;
        }
    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = iStudentService.findById(id);
        request.setAttribute("student", student);
        RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void ShowListStudent(HttpServletRequest request, HttpServletResponse response) {
        List<Student> list = iStudentService.display();
        request.setAttribute("list",list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                create(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "update":
                update(request,response);
                break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Boolean gender = request.getParameter("gender").equals("male");
        Double point = Double.parseDouble(request.getParameter("point"));
        Student student = new Student(id, name, gender, point);
        iStudentService.update(student);
        try {
            response.sendRedirect("/students");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id_delete"));
        iStudentService.deleteById(id);
        try {
            response.sendRedirect("/students");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Boolean gender = request.getParameter("gender").equals("male");
        Double point = Double.parseDouble(request.getParameter("point"));
        iStudentService.save(new Student(name,gender,point));
        try {
            response.sendRedirect("/students");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
