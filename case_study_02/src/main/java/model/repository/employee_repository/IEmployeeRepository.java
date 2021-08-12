package model.repository.employee_repository;

import model.bean.employee.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAll();

    String edit(Employee employee);

    Employee findByID(int employeeId);

    void remove(int id);

    boolean create(Employee employee);
}
