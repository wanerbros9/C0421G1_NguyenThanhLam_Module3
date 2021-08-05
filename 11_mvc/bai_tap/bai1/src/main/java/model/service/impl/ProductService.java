package model.service.impl;

import model.bean.Product;
import model.service.IProductService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {

    private static Map<Integer, Product> productMap;

    static {
        productMap = new HashMap<>();
        productMap.put(1, new Product(1,"Apple","USA",10000));
        productMap.put(2, new Product(2,"Pineapple","USA",15000));
        productMap.put(3, new Product(3,"Mango","USA",9000));
        productMap.put(4, new Product(4,"Orange","USA",17000));
        productMap.put(5, new Product(5,"Banana","USA",19000));
        productMap.put(6, new Product(6,"Lemon","USA",8000));
    }

    @Override
    public List<Product> findAll() {
        return null;
    }

    @Override
    public void save(Product product) {

    }

    @Override
    public Product findByID(int id) {
        return null;
    }

    @Override
    public void update(int id, Product product) {

    }

    @Override
    public void remove(int id) {

    }
}
