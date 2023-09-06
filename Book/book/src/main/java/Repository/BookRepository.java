package Repository;

import Model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository{
    private final String SELECT_BOOK = "select * from Book";
    private final String BORROW_BOOK ="select book_name, book_id, quantity_book from Book where book_id = ?";
    @Override
    public List<Book> display() {
        Connection connection = BaseRepository.getConnection();
        List<Book> list = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_BOOK);
            while (resultSet.next()) {
                int book_id = resultSet.getInt("book_id");
                String book_name = resultSet.getString("book_name");
                String author = resultSet.getString("author");
                String describe_book = resultSet.getString("describe_book");
                int quantity_book = resultSet.getInt("quantity_book");
                Book book = new Book(book_id, book_name, author, describe_book, quantity_book);
                list.add(book);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public Book findall(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(BORROW_BOOK);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int book_id = resultSet.getInt("book_id");
                String book_name = resultSet.getString("book_name");
                int quantity_book = resultSet.getInt("quantity_book");
                Book book = new Book(book_id, book_name, quantity_book);
                return book;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
