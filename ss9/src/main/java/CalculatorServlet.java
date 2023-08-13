import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double num1=Double.parseDouble(request.getParameter("number1"));
        double num2=Double.parseDouble(request.getParameter("number2"));
        double result=num1 + num2;
        request.setAttribute("cong",result);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/wed.jsp");
        requestDispatcher.forward(request,response);
    }
}
