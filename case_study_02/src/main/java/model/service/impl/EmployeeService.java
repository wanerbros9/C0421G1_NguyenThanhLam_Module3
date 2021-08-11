package model.service.impl;

import model.bean.Employee;
import model.repository.EmployeeRepository;
import model.repository.IEmployeeRepository;
import model.service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {

    IEmployeeRepository iEmployeeRepository = new EmployeeRepository();


    @Override
    public List<Employee> findAll() {
        return iEmployeeRepository.findAll();
    }

    @Override
    public String edit(Employee employee) {
        return this.iEmployeeRepository.edit(employee);
    }

    @Override
    public Employee findByID(int employee_id) {
        return iEmployeeRepository.findByID(employee_id);
    }

    @Override
    public void remove(int id) {

    }

    @Override
    public boolean create(Employee employee) {
        return false;
    }
}
