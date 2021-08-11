package model.service;

import model.bean.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();

    String edit(Employee employee);

    Employee findByID(int employee_id);

    void remove(int id);

    boolean create(Employee employee);
}
