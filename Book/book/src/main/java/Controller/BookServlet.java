package Controller;

import Model.Book;
import Model.Book_card;
import Model.Student;
import Service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BookServlet", value = "/books")
public class BookServlet extends HttpServlet {
    private IBookService iBookService = new BookService();
    private IStudentService iStudentService = new StudentService();
    private IBookCardService iBookCardService = new BookCardService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showListBorrow":
                showListBorrow(request, response);
                break;
            default:
                ShowListBook(request, response);
        }
    }

    private void showListBorrow(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Student> studentList = iStudentService.listStudent();
        LocalDate localDate = LocalDate.now();
        Book book = iBookService.findall(id);
        request.setAttribute("studentList", studentList);
        request.setAttribute("book", book);
        request.setAttribute("localDate", localDate);
        try {
            if (book.getQuantity_book() == 0) {
                response.sendRedirect("/books?ms=0");
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("borrow_book.jsp");
                dispatcher.forward(request, response);
            }
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void ShowListBook(HttpServletRequest request, HttpServletResponse response) {
        List<Book> list_Book = iBookService.display();
        request.setAttribute("list_Book", list_Book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list_book.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
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
            case "borrowBook":
                borrowBook(request, response);
                break;
        }
    }

    private void borrowBook(HttpServletRequest request, HttpServletResponse response) {
        String book_name = request.getParameter("book_name");
        String book_card_id = request.getParameter("book_card_id");
        LocalDate startDay = LocalDate.parse(request.getParameter("startday"));
        LocalDate endDay = LocalDate.parse(request.getParameter("endday"));
        Book_card bookCard = new Book_card(book_card_id, startDay, endDay);
        Map<String, String> map = iBookCardService.save(bookCard);
        List<Student> studentList = iStudentService.listStudent();
        Book book = new Book(book_name);
        try {
            if (map.isEmpty()) {
                response.sendRedirect("/books?ms=1");
            } else {
                request.setAttribute("map", map);
                request.setAttribute("book_name", book_name);
                request.setAttribute("localDate", startDay);
                request.setAttribute("bookCard", bookCard);
                request.setAttribute("studentList", studentList);
                request.setAttribute("book", book);
                request.getRequestDispatcher("borrow_book.jsp").forward(request, response);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
