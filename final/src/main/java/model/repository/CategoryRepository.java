package model.repository;

import model.bean.Category;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository{

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List showAll() {
        List<Category> categoryList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "select * from category");
            ResultSet resultSet = preparedStatement.executeQuery();

            Category category = null;
            while (resultSet.next()){
                category = new Category();
                category.setCategoryId(resultSet.getInt("category_id"));
                category.setCategoryName(resultSet.getString("category_name"));

                categoryList.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
    }
}
