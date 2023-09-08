package Service;

import Model.Book_card;
import Repository.BookCardRepository;
import Repository.IBookCardRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookCardService implements IBookCardService{
    private IBookCardRepository iBookCardRepository = new BookCardRepository();
    @Override
    public Map<String, String> save(Book_card bookCard) {
        Map<String, String> map = new HashMap<>();
        if(!bookCard.getBook_card_id().matches("MS-\\d{4}")) {
            map.put("book_card_id", "Mã mượn sách không đúng định dạng");
        }
        if(bookCard.getEndDate().isBefore(bookCard.getStartDate())) {
            map.put("date", "Ngày trả sách không được phép trước ngày mượn sách");
        }
        return map;
    }

    @Override
    public void listBookCard(Book_card bookCard) {
         iBookCardRepository.listBookCard(bookCard);
    }

    @Override
    public List<Book_card> displayBookCard() {
        return iBookCardRepository.displayBookCard();
    }

    @Override
    public void updateStatus(int id, boolean status) {
        iBookCardRepository.updateStatus(id, status);
    }

    @Override
    public List<Book_card> searchBookAndStudent(String book, String student) {
        return iBookCardRepository.searchBookAndStudent(book, student);
    }
}
