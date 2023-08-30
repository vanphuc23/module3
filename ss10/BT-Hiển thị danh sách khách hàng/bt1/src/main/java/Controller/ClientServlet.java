package Controller;

import Model.Client;
import Service.ClientService;
import Service.IClientService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ClientServlet", value = "")
public class ClientServlet extends HttpServlet {
    private IClientService iClientService=new ClientService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Client> list=iClientService.display();
        request.setAttribute("list",list);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
