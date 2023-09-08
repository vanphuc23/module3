package Model;

public class Student {
    private int student_id;
    private String student_name;
    private String student_class;

    public Student(int student_id, String student_name, String student_class) {
        this.student_id = student_id;
        this.student_name = student_name;
        this.student_class = student_class;
    }

    public Student(String student_name) {
        this.student_name = student_name;
    }

    public Student(int student_id, String student_name) {
        this.student_id = student_id;
        this.student_name = student_name;
    }

    public Student(int student_id) {
        this.student_id = student_id;
    }

    public Student(String student_name, String student_class) {
        this.student_name = student_name;
        this.student_class = student_class;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getStudent_class() {
        return student_class;
    }

    public void setStudent_class(String student_class) {
        this.student_class = student_class;
    }
}
