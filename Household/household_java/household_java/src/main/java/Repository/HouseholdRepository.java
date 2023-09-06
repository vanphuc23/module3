package Repository;

import Model.Household;
import Model.Member;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class HouseholdRepository implements IHouseholdRepository {
    private final String SELECT = "select * from household";
    private final String EDIT = "select * from household where household_id = ?";
    private final String UPDATE = "update household set household_name = ? ,household_date = ?, address = ? where household_id = ?";
    private final String SELECT_MEMBER = "select m.name, h.household_id from household h join member m on m.household_id = h.household_id where m.household_id=?";

    @Override
    public List<Household> display() {
        Connection connection = BaseRepository.getConnection();
        List<Household> list = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int household_id = resultSet.getInt("household_id");
                String household_code = resultSet.getString("household_code");
                String household_name = resultSet.getString("household_name");
                int number = resultSet.getInt("number");
                Date household_date = resultSet.getDate("household_date");
                LocalDate date = household_date.toLocalDate();
                String date_format = date.format(formatter);
                String address = resultSet.getString("address");
                Household household = new Household(household_id, household_code, household_name, number, date_format, address);
                list.add(household);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public Household editHousehold(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int household_id = resultSet.getInt("household_id");
                String household_code = resultSet.getString("household_code");
                String household_name = resultSet.getString("household_name");
                int number = resultSet.getInt("number");
                Date household_date = resultSet.getDate("household_date");
                LocalDate date = household_date.toLocalDate();
                String address = resultSet.getString("address");
                Household household = new Household(household_id, household_code, household_name, number, address, date);
                return household;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void updateHousehold(Household household) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, household.getHousehold_name());
            Date sqlDate = Date.valueOf(household.getDate());
            preparedStatement.setDate(2, sqlDate);
            preparedStatement.setString(3, household.getAddress());
            preparedStatement.setInt(4, household.getHousehold_id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
