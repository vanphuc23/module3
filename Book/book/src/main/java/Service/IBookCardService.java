package Service;

import Model.Book_card;

import java.util.List;
import java.util.Map;

public interface IBookCardService {
    Map<String, String> save(Book_card bookCard);
    void listBookCard(Book_card bookCard);
    List<Book_card> displayBookCard();
    void updateStatus(int id, boolean status);
    List<Book_card> searchBookAndStudent(String book, String student);
}
