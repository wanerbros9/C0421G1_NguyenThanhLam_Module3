package model.service.impl;

import model.bean.Product;
import model.repository.IProductRepository;
import model.repository.ProductRepository;
import model.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {

    IProductRepository iProductRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return this.iProductRepository.findAll();
    }

    @Override
    public String edit(Product product) {
        return this.iProductRepository.edit(product);
    }

    @Override
    public Product findByID(int productId) {
        return this.iProductRepository.findByID(productId);
    }

    @Override
    public void remove(int productId) {
        this.iProductRepository.remove(productId);
    }

    @Override
    public boolean create(Product product) {
        return this.iProductRepository.create(product);
    }
}
