package Service;

import Model.Book;

import java.util.List;

public interface IBookService {
    List<Book> display();
    Book findall(int id);
}
