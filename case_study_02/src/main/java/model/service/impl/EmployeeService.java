package model.service.impl;

import model.bean.employee.Employee;
import model.repository.employee_repository.EmployeeRepository;
import model.repository.employee_repository.IEmployeeRepository;
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
    public Employee findByID(int employeeId) {
        return iEmployeeRepository.findByID(employeeId);
    }

    @Override
    public void remove(int id) {
        this.iEmployeeRepository.remove(id);
    }

    @Override
    public boolean create(Employee employee) {
        return this.iEmployeeRepository.create(employee);
    }
}
