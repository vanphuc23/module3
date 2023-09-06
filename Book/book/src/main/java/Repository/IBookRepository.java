package Repository;

import Model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> display();
    Book findall(int id);
}
