package repository;

import model.Customer;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_CUSTOMER = "select * from customer";
    private final String SELECT_PHONE_EXIST = "select * from customer where customer_phone = ?";
    private final String INSERT_CUSTOMER = "insert into customer(customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card,\n" +
            "                     customer_phone, customer_email, customer_address)\n" +
            "values (?, ?, ?, ?, ?, ?, ?, ?)";

    @Override
    public List<Customer> display() {
        Connection connection = BaseRepository.getConnection();
        List<Customer> customerList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_CUSTOMER);
            while (resultSet.next()) {
                int customer_id = resultSet.getInt("customer_id");
                int customer_type_id = resultSet.getInt("customer_type_id");
                String customer_name = resultSet.getString("customer_name");
                Date customer_birthday = resultSet.getDate("customer_birthday");
                SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                String dateFormat = format.format(customer_birthday);
                Boolean customer_gender = resultSet.getBoolean("customer_gender");
                String customer_id_card = resultSet.getString("customer_id_card");
                String customer_phone = resultSet.getString("customer_phone");
                String customer_email = resultSet.getString("customer_email");
                String customer_address = resultSet.getString("customer_address");
                Customer customer = new Customer(customer_id, customer_type_id, customer_name, dateFormat, customer_gender, customer_id_card,
                        customer_phone, customer_email, customer_address);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void createCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setInt(1, customer.getCustomer_type_id());
            preparedStatement.setString(2, customer.getCustomer_name());
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(customer.getCustomer_birthday());
            java.sql.Date sqldate = new java.sql.Date(date.getTime());
            preparedStatement.setDate(3, sqldate);
            preparedStatement.setBoolean(4, customer.isCustomer_gender());
            preparedStatement.setString(5, customer.getCustomer_id_card());
            preparedStatement.setString(6, customer.getCustomer_phone());
            preparedStatement.setString(7, customer.getCustomer_email());
            preparedStatement.setString(8, customer.getCustomer_address());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean checkPhoneExist(String phone) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PHONE_EXIST);
            preparedStatement.setString(1, phone);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
