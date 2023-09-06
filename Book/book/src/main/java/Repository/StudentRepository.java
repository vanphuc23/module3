package Repository;

import Model.Book;
import Model.Student;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository{
    private final String LIST_STUDENT = "select student_name from Student";

    @Override
    public List<Student> listStudent() {
        Connection connection = BaseRepository.getConnection();
        List<Student> list = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(LIST_STUDENT);
            while (resultSet.next()) {
                String student_name = resultSet.getString("student_name");
                Student student = new Student(student_name);
                list.add(student);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
