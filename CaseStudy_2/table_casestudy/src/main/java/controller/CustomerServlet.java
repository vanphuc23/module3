package controller;


import model.Customer;
import service.CustomerService;
import service.ICustomerService;
import validation.ValidCustomer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService iCustomerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "CustomerList":
                CustomerList(request, response);
                break;
            case "CreateListCustomer":
                CreateListCustomer(request, response);
                break;
            default:
                ListTable(request, response);
                break;
        }
    }

    private void CreateListCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Customer/createCustomer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void ListTable(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void CustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = iCustomerService.display();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Customer/listCustomer.jsp");
        try {
            dispatcher.forward(request, response);
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
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "CreateCustomer":
                CreateCustomer(request, response);
                break;
            default:
                ListTable(request, response);
                break;
        }
    }

    private void CreateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customer_type_id = Integer.parseInt(request.getParameter("customer_type_id"));
        String customer_name = request.getParameter("customer_name");
        String customer_birthday = request.getParameter("customer_birthday");
        Boolean customer_gender = request.getParameter("customer_gender").equals("male");
        String customer_id_card = request.getParameter("customer_id_card");
        String customer_phone = request.getParameter("customer_phone");
        String customer_email = request.getParameter("customer_email");
        String customer_address = request.getParameter("customer_address");
        Customer customer = new Customer(customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address);

        if(ValidCustomer.PhoneExist(customer_phone)) {
            request.setAttribute("phoneExist", true);
            request.setAttribute("cus",customer);
            request.getRequestDispatcher("/Customer/createCustomer.jsp").forward(request, response);
        }
        else {

            iCustomerService.createCustomer(customer);
            try {
                response.sendRedirect("/customer?action=CustomerList");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
