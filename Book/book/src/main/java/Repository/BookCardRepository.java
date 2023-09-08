package Repository;

import Model.Book;
import Model.Book_card;
import Model.Student;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class BookCardRepository implements IBookCardRepository {
    private final String INSERT_BOOK_CARD = "insert into Book_card(book_card_id, book_id, student_id, status, start_day, end_day)\n" +
            "values(?, ?, ?, ?, ?, ?);";
    private final String BOOK_CARD = "select bc.id, bc.book_card_id, b.book_id, b.book_name, b.author, b.quantity_book,  s.student_name, s.class, bc.status, bc.start_day, bc.end_day \n" +
            "from Book b join Book_card bc on b.book_id = bc.book_id\n" +
            "join Student s on s.student_id = bc.student_id";
    private final String UPDATE_STATUS = "update Book_card set status = ? where (id = ?)";
    private final String SEARCH_BOOK_STUDENT = "select bc.id, bc.book_card_id, b.book_id, b.book_name, b.author, b.quantity_book, s.student_name, s.class, bc.status, bc.start_day, bc.end_day \n" +
            "from Book b join Book_card bc on b.book_id = bc.book_id\n" +
            "join Student s on s.student_id = bc.student_id where b.book_name like ? and s.student_name like ?";

    @Override
    public void listBookCard(Book_card bookCard) {

        Date startDay = Date.valueOf(bookCard.getStartDate());
        Date endDay = Date.valueOf(bookCard.getEndDate());
        try (
                Connection connection = BaseRepository.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK_CARD);
        ) {

            preparedStatement.setString(1, bookCard.getBook_card_id());
            preparedStatement.setInt(2, bookCard.getBook().getBook_id());
            preparedStatement.setInt(3, bookCard.getStudent().getStudent_id());
            preparedStatement.setBoolean(4, bookCard.isStatus());
            preparedStatement.setDate(5, startDay);
            preparedStatement.setDate(6, endDay);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Book_card> displayBookCard() {
        List<Book_card> list = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        try (
                Connection connection = BaseRepository.getConnection();
                Statement statement = connection.createStatement();
        ) {
            ResultSet resultSet = statement.executeQuery(BOOK_CARD);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String book_card_id = resultSet.getString("book_card_id");
                int book_id = resultSet.getInt("book_id");
                String book_name = resultSet.getString("book_name");
                String author = resultSet.getString("author");
                int quantity_book = resultSet.getInt("quantity_book");
                Book book = new Book(book_id, book_name, author, quantity_book);
                String student_name = resultSet.getString("student_name");
                String _class = resultSet.getString("class");
                Student student = new Student(student_name, _class);
                Boolean status = resultSet.getBoolean("status");
                Date start_day = resultSet.getDate("start_day");
                LocalDate startDay = start_day.toLocalDate();
                String start = startDay.format(formatter);
                Date end_day = resultSet.getDate("end_day");
                LocalDate endDay = end_day.toLocalDate();
                String end = endDay.format(formatter);
                Book_card bookCard = new Book_card(id, book_card_id, book, student, status, start, end);
                list.add(bookCard);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void updateStatus(int id, boolean status) {
        try(
                Connection connection = BaseRepository.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STATUS);
                ) {
            preparedStatement.setBoolean(1, status);
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Book_card> searchBookAndStudent(String book, String student) {
        List<Book_card> list = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        try (
                Connection connection = BaseRepository.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BOOK_STUDENT);
                ){
            preparedStatement.setString(1, "%" + book + "%");
            preparedStatement.setString(2, "%" + student + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String book_card_id = resultSet.getString("book_card_id");
                int book_id = resultSet.getInt("book_id");
                String book_name = resultSet.getString("book_name");
                String author = resultSet.getString("author");
                int quantity_book = resultSet.getInt("quantity_book");
                Book book2 = new Book(book_id, book_name, author, quantity_book);
                String student_name = resultSet.getString("student_name");
                String _class = resultSet.getString("class");
                Student student2 = new Student(student_name, _class);
                Boolean status = resultSet.getBoolean("status");
                Date start_day = resultSet.getDate("start_day");
                LocalDate startDay = start_day.toLocalDate();
                String start = startDay.format(formatter);
                Date end_day = resultSet.getDate("end_day");
                LocalDate endDay = end_day.toLocalDate();
                String end = endDay.format(formatter);
                Book_card bookCard = new Book_card(id, book_card_id, book2, student2, status, start, end);
                list.add(bookCard);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
