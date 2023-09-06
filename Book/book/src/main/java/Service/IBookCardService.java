package Service;

import Model.Book_card;

import java.util.Map;

public interface IBookCardService {
    Map<String, String> save(Book_card bookCard);
}
