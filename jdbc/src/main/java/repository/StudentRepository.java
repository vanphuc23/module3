package repository;

import model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository{
    private final String SELECT = "select * from Student";
    private final String INSERT = "insert into student(name,gender,point)\n" +
            "values(?,?,?)";
    private final String DELETE = "call delete_by_id(?)";
    private final String FIND_ID = "call find_by_id(?)";
    private final String UPDATE = "call update_by_id(?, ?, ?, ?)";

    @Override
    public List<Student> display() {
        List<Student> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement =connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Boolean gender = resultSet.getBoolean("gender");
                Double point = resultSet.getDouble("point");
                list.add(new Student(id,name,gender,point));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void save(Student student) {
        Connection con = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = con.prepareStatement(INSERT);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setBoolean(2,student.isGender());
            preparedStatement.setDouble(3,student.getPoint());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteById(int id) {
        Connection con = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = con.prepareCall(DELETE);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Student findById(int id) {
        Connection con = BaseRepository.getConnection();
        Student student;
        try {
            CallableStatement callableStatement = con.prepareCall(FIND_ID);
            callableStatement.setInt(1,id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id_student = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Boolean gender = resultSet.getBoolean("gender");
                Double point = resultSet.getDouble("point");
                student = new Student(id_student, name, gender, point);
                return student;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Student student) {
        Connection con = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = con.prepareCall(UPDATE);
            callableStatement.setInt(1,student.getId());
            callableStatement.setString(2,student.getName());
            callableStatement.setBoolean(3,student.isGender());
            callableStatement.setDouble(4,student.getPoint());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
