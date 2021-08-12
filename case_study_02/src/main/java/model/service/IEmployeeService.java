package model.service;

import model.bean.employee.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();

    String edit(Employee employee);

    Employee findByID(int employeeId);

    void remove(int id);

    boolean create(Employee employee);
}
