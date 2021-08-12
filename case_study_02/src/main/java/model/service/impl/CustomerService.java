package model.service.impl;

import model.bean.customer.Customer;
import model.repository.customer_repository.CustomerRepository;
import model.repository.customer_repository.ICustomerRepository;
import model.service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {

    ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return this.iCustomerRepository.findAll();
    }

    @Override
    public String edit(Customer customer) {
        return this.iCustomerRepository.edit(customer);
    }

    @Override
    public Customer findById(int customerId) {
        return this.iCustomerRepository.findById(customerId);
    }

    @Override
    public void remove(int customerId) {
        this.iCustomerRepository.remove(customerId);
    }

    @Override
    public boolean create(Customer customer) {
        return this.iCustomerRepository.create(customer);
    }
}
