package Model;

import java.time.LocalDate;

public class Book_card {
    private String book_card_id;
    private Book book;
    private Student student;
    private boolean status;
    private LocalDate startDate;
    private LocalDate endDate;

    public Book_card(String book_card_id, Book book, Student student, boolean status, LocalDate startDate, LocalDate endDate) {
        this.book_card_id = book_card_id;
        this.book = book;
        this.student = student;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Book_card(String book_card_id, LocalDate startDate, LocalDate endDate) {
        this.book_card_id = book_card_id;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public String getBook_card_id() {
        return book_card_id;
    }

    public void setBook_card_id(String book_card_id) {
        this.book_card_id = book_card_id;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }
}
