package model.repository;

import model.bean.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAll();

    String edit(Employee employee);

    Employee findByID(int employee_id);

    void remove(int id);

    boolean create(Employee user);
}
