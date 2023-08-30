package Service;

import Model.User;

import java.util.List;

public interface IUserService {
    List<User> display();
    void create(User user);
    User findById(int id);
    void updateById(User user);
    void deleteById(int id);
    List<User> search(String countrySearch);
    List<User> arrange();
}
