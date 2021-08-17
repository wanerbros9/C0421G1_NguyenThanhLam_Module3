package model.service;

import model.bean.customer.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> findAll();

    String edit(Customer customer);

    Customer findById(int customerId);

    void remove(int customerId);

    Map<String, String> create(Customer customer);
}
