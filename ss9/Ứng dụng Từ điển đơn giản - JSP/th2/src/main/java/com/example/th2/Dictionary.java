package com.example.th2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "Dictionary", value = "/dictionary")
public class Dictionary extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String,String> map=new HashMap<>();
        map.put("Hello","Xin chào");
        String search=req.getParameter("search");
        String result=map.get(search);
        if(result != null) {
            req.setAttribute("list",result);
            RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
            dispatcher.forward(req,resp);
        } else {
            RequestDispatcher dispatcher=req.getRequestDispatcher("error.jsp");
            dispatcher.forward(req,resp);
        }
    }
}
