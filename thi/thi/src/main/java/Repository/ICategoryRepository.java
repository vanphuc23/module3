package Repository;

import Model.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> findAll();

    Category findIdCategory(int id);

    List<Category> find(int id);
}
