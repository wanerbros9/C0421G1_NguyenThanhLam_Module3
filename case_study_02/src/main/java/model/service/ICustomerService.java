package model.service;

import model.bean.customer.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();

    String edit(Customer customer);

    Customer findById(int customerId);

    void remove(int customerId);

    boolean create(Customer customer);
}
