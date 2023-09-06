package Repository;

import Model.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberRepository implements IMemberRepository {
    private final String SELECT_MEMBER = "select * from member where household_id = ?";

    @Override
    public List<Member> findAll(int id) {
        Connection connection = BaseRepository.getConnection();
        List<Member> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MEMBER);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int household_id = resultSet.getInt("household_id");
                Member member = new Member(name, household_id);
                list.add(member);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
