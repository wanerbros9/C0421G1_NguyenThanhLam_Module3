package model.repository;

import model.bean.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "select * from product");
            ResultSet resultSet = preparedStatement.executeQuery();

            Product product = null;
            while (resultSet.next()) {
                product = new Product();
                product.setProductId(resultSet.getInt("product_id"));
                product.setProductName(resultSet.getString("product_name"));
                product.setProductPrice(resultSet.getInt("product_price"));
                product.setProductQuantity(resultSet.getInt("product_quantity"));
                product.setProductColor(resultSet.getString("product_color"));
                product.setCategoryId(resultSet.getInt("category_id"));

                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public String edit(Product product) {
        int row = 0;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "update product\n" +
                                    "set product_name = ?,product_price= ?,product_quantity= ?,product_color= ?,category_id= ?\n" +
                                    "where product_id = ?");
            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setInt(2, product.getProductPrice());
            preparedStatement.setInt(3, product.getProductQuantity());
            preparedStatement.setString(4, product.getProductColor());
            preparedStatement.setInt(5, product.getCategoryId());
            preparedStatement.setInt(6, product.getProductId());
            row = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row > 0 ? "Success" : "Fail";
    }

    @Override
    public Product findByID(int productId) {
        Product product = null;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "select * from product where product_id = ?");
            preparedStatement.setInt(1, productId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                product = new Product();
                product.setProductId(productId);
                product.setProductName(resultSet.getString("product_name"));
                product.setProductPrice(resultSet.getInt("product_price"));
                product.setProductQuantity(resultSet.getInt("product_quantity"));
                product.setProductColor(resultSet.getString("product_color"));
                product.setCategoryId(resultSet.getInt("category_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public void remove(int productId) {
        int row = 0;

        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "delete from product\n" +
                                    "where product_id = ?");
            preparedStatement.setString(1, productId + "");
            row = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean create(Product product) {
        int row = 0;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "insert into product (product_name, product_price, product_quantity, product_color, category_id) \n" +
                                    "value (?,?,?,?,?)");
            preparedStatement.setString(1,product.getProductName());
            preparedStatement.setInt(2,product.getProductPrice());
            preparedStatement.setInt(3,product.getProductQuantity());
            preparedStatement.setString(4, product.getProductColor());
            preparedStatement.setInt(5,product.getCategoryId());
            row = preparedStatement.executeUpdate();
            if (row>0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
