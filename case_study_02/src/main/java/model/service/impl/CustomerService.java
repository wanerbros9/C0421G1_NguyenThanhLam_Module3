package model.service.impl;

import model.bean.customer.Customer;
import model.repository.customer_repository.CustomerRepository;
import model.repository.customer_repository.ICustomerRepository;
import model.service.ICustomerService;
import model.service.commons.Regex;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService, Regex {

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
    public Map<String, String> create(Customer customer) {
        Map<String, String> message = new HashMap<>();
        boolean check = true;
        String msg = null;

//        if (!customer.getCustomerCode().matches(CUSTOMER_CODE)) {
//            check = false;
//            msg = "Incorrect, Please Try Again.(Ex:KH-XXXX,X is number)";
//            message.put("Code",msg);
//        }

        if (!customer.getCustomerName().matches(REGEX_NAME)) {
            check = false;
            msg = "Incorrect name, Please try again";
            message.put("customerName", msg);
        }

        if (!customer.getCustomerIdCard().matches(ID_CARD)) {
            check = false;
            msg = "Incorrect format, Please try again";
            message.put("IdCard", msg);
        }

        if (!customer.getCustomerPhone().matches(PHONE_NUMBER)) {
            check = false;
            msg = "Incorrect format, Please try again";
            message.put("Phone", msg);
        }

        if (!customer.getCustomerEmail().matches(EMAIL)) {
            check = false;
            msg = "Incorrect format, Please try again";
            message.put("Email", msg);
        }

        if (check) {
            this.iCustomerRepository.create(customer);
        }
        return message;
    }
}
