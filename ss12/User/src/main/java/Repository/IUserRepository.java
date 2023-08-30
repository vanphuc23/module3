package Repository;

import Model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    List<User> display();
    void create(User user);
    User findById(int id);
    void updateById(User user);
    void deleteById(int id);
    List<User> search(String countrySearch);
    List<User> arrange();
}
