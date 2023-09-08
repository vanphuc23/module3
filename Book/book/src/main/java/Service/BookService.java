package Service;

import Model.Book;
import Repository.BookRepository;
import Repository.IBookRepository;

import java.util.List;

public class BookService implements IBookService{
    private IBookRepository iBookRepository = new BookRepository();

    @Override
    public List<Book> display() {
        return iBookRepository.display();
    }

    @Override
    public Book findall(int id) {
        return iBookRepository.findall(id);
    }

    @Override
    public void update(int id, int number) {
        iBookRepository.update(id, number);
    }
}
