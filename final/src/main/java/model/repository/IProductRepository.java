package model.repository;

import model.bean.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    String edit(Product product);

    Product findByID(int productId);

    void remove(int productId);

    boolean create(Product product);
}
