package Model;

public class Book {
    private int book_id;
    private String book_name;
    private String author;
    private String describe_book;
    private int quantity_book;

    public Book(int book_id, String book_name, String author, String describe_book, int quantity_book) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.author = author;
        this.describe_book = describe_book;
        this.quantity_book = quantity_book;
    }

    public Book(String book_name, String author, String describe_book, int quantity_book) {
        this.book_name = book_name;
        this.author = author;
        this.describe_book = describe_book;
        this.quantity_book = quantity_book;
    }

    public Book(int book_id, String book_name, int quantity_book) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.quantity_book = quantity_book;
    }

    public Book(int book_id) {
        this.book_id = book_id;
    }

    public Book(String book_name, String author) {
        this.book_name = book_name;
        this.author = author;
    }

    public Book(int book_id, String book_name, String author, int quantity_book) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.author = author;
        this.quantity_book = quantity_book;
    }

    public Book(String book_name) {
        this.book_name = book_name;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescribe_book() {
        return describe_book;
    }

    public void setDescribe_book(String describe_book) {
        this.describe_book = describe_book;
    }

    public int getQuantity_book() {
        return quantity_book;
    }

    public void setQuantity_book(int quantity_book) {
        this.quantity_book = quantity_book;
    }
}
