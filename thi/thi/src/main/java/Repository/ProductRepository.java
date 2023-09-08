package Repository;

import Model.Category;
import Model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final String SELECT = "select * from Product p join Category c on p.id=c.id";
    private final String INSERT = "insert into Product(name, price, number, color, mota, id) \n" +
            "values (?, ?, ?, ?, ?, ?)";
    private final String SELECT_PRODUCT = "select p.*, c.type from Product p join Category c on p.id=c.id where p.id_product=?";
    private final String UPDATE = "update Product set name = ?, price = ?, number = ?, color = ?, mota = ?, id = ? where id_product = ?";
    private final String DELETE = "delete from Product where id_product = ?";
    private final String SEARCH_NAME = "select p.*, c.type from Product p join Category c on p.id=c.id where p.name like ?";

    @Override
    public List<Product> display() {
        List<Product> list = new ArrayList<>();
        try (
                Connection connection = BaseRepository.getConnection();
                Statement statement = connection.createStatement();
        ) {
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id_product = resultSet.getInt("id_product");
                String name = resultSet.getString("name");
                Double price = resultSet.getDouble("price");
                int number = resultSet.getInt("number");
                String color = resultSet.getString("color");
                String mota = resultSet.getString("mota");
                int id = resultSet.getInt("id");
                String type = resultSet.getString("type");
                Category category = new Category(id, type);
                Product product = new Product(id_product, name, price, number, color, mota, category);
                list.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }

    @Override
    public void create(Product product) {
        try (
                Connection connection = BaseRepository.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
        ) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getNumber());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5, product.getMota());
            preparedStatement.setInt(6, product.getCategory().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product edit(int id) {
        try (
                Connection connection = BaseRepository.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT);
        ) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_product = resultSet.getInt("id_product");
                String name = resultSet.getString("name");
                Double price = resultSet.getDouble("price");
                int number = resultSet.getInt("number");
                String color = resultSet.getString("color");
                String mota = resultSet.getString("mota");
                int id2 = resultSet.getInt("id");
                String type = resultSet.getString("type");
                Category category = new Category(id2, type);
                Product product = new Product(id_product, name, price, number, color, mota, category);
                return product;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public void update(Product product) {
        try (
                Connection connection = BaseRepository.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
        ) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getNumber());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5, product.getMota());
            preparedStatement.setInt(6, product.getCategory().getId());
            preparedStatement.setInt(7, product.getId_product());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(int id) {
        try (
                Connection connection = BaseRepository.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
        ) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Product> searchName(String name) {
        List<Product> productList = new ArrayList<>();
        try (
                Connection connection = BaseRepository.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_NAME);
        ) {
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id_product = resultSet.getInt("id_product");
                String nameProduct = resultSet.getString("name");
                Double price = resultSet.getDouble("price");
                int number = resultSet.getInt("number");
                String color = resultSet.getString("color");
                String mota = resultSet.getString("mota");
                int id = resultSet.getInt("id");
                String type = resultSet.getString("type");
                Category category = new Category(id, type);
                Product product = new Product(id_product, nameProduct, price, number, color, mota, category);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }
}
