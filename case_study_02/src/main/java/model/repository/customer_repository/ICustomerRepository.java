package model.repository.customer_repository;

import model.bean.customer.Customer;
import model.bean.employee.Employee;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    String edit(Customer customer);

    Customer findById(int customerId);

    void remove(int customerId);

    boolean create(Customer customer);
}
