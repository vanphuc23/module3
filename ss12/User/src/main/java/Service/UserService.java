package Service;

import Model.User;
import Repository.IUserRepository;
import Repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private final IUserRepository iUserRepository = new UserRepository();

    @Override
    public List<User> display() {
        return iUserRepository.display();
    }

    @Override
    public void create(User user) {
        iUserRepository.create(user);
    }

    @Override
    public User findById(int id) {
        return iUserRepository.findById(id);
    }

    @Override
    public void updateById(User user) {
        iUserRepository.updateById(user);
    }

    @Override
    public void deleteById(int id) {
        iUserRepository.deleteById(id);
    }

    @Override
    public List<User> search(String countrySearch) {
        return iUserRepository.search(countrySearch);
    }

    @Override
    public List<User> arrange() {
        return iUserRepository.arrange();
    }
}
