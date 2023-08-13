package com.example.ss9;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/Discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price=Double.parseDouble(request.getParameter("price"));
        double discount=Double.parseDouble(request.getParameter("discount"));
        double result= price * discount * 0.01;
        double priceAfter = price - price*result;
        request.setAttribute("amount",result);
        request.setAttribute("price",priceAfter);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/amount.jsp");
        requestDispatcher.forward(request,response);
    }
}
