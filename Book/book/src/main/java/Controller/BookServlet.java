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
            case "showListBorrowBook":
                showListBorrowBook(request, response);
                break;
            default:
                ShowListBook(request, response);
        }
    }

    private void showListBorrowBook(HttpServletRequest request, HttpServletResponse response) {
        List<Book_card> list = iBookCardService.displayBookCard();
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list_borrow_book.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
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
            case "giveBookBack":
                giveBookBack(request, response);
                break;
            case "searchBookorStudent":
                searchBookorStudent(request, response);
                break;
        }
    }

    private void searchBookorStudent(HttpServletRequest request, HttpServletResponse response) {
        String search_book_name = request.getParameter("search_book_name");
        String search_student_name = request.getParameter("search_student_name");
        List<Book_card> list = iBookCardService.searchBookAndStudent(search_book_name, search_student_name);
        request.setAttribute("list", list);
        request.setAttribute("search_book_name", search_book_name);
        request.setAttribute("search_student_name", search_student_name);
            RequestDispatcher dispatcher = request.getRequestDispatcher("list_borrow_book.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void giveBookBack(HttpServletRequest request, HttpServletResponse response) {
        int book_id = Integer.parseInt(request.getParameter("book_id"));
        int quantity_book = Integer.parseInt(request.getParameter("quantity_book"));
        iBookService.update(book_id, quantity_book + 1);
        int id = Integer.parseInt(request.getParameter("id"));
        iBookCardService.updateStatus(id, false);
        try {
            response.sendRedirect("/books?action=showListBorrowBook");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void borrowBook(HttpServletRequest request, HttpServletResponse response) {
        int book_id = Integer.parseInt(request.getParameter("book_id"));
        int quantity_book = Integer.parseInt(request.getParameter("quantity_book"));
        String book_name = request.getParameter("book_name");
        String book_card_id = request.getParameter("book_card_id");
        LocalDate startDay = LocalDate.parse(request.getParameter("startday"));
        LocalDate endDay = LocalDate.parse(request.getParameter("endday"));
        int student_id = Integer.parseInt(request.getParameter("student_name"));
        Boolean status = true;
        Book book2 = new Book(book_id);
        Student student = new Student(student_id);
        Book_card book_card = new Book_card(book_card_id, book2, student, status, startDay, endDay);
        Book_card bookCard = new Book_card(book_card_id, startDay, endDay);
        Map<String, String> map = iBookCardService.save(bookCard);
        List<Student> studentList = iStudentService.listStudent();
        Book book = new Book(book_id, book_name, quantity_book);
        try {
            if (map.isEmpty()) {
                iBookService.update(book_id, quantity_book - 1);
                iBookCardService.listBookCard(book_card);
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
