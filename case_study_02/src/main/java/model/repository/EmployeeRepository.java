package model.repository;

import model.bean.Employee;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "SELECT * from furama_resort_01.employee");
            ResultSet resultSet = preparedStatement.executeQuery();

            Employee employee = null;
            while (resultSet.next()) {
                employee = new Employee();
                employee.setEmployeeId(resultSet.getInt("employee_id"));
                employee.setEmployeeName(resultSet.getString("employee_name"));
                employee.setPositionId(resultSet.getInt("position_id"));
                employee.setEducationDegreeId(resultSet.getInt("education_degree_id"));
                employee.setDivisionId(resultSet.getInt("division_id"));
                employee.setEmployeeBirthday(resultSet.getString("employee_birthday"));
                employee.setEmployeeIdCard(resultSet.getString("employee_id_card"));
                employee.setEmployeeSalary(resultSet.getDouble("employee_salary"));
                employee.setEmployeePhone(resultSet.getString("employee_phone"));
                employee.setEmployeeEmail(resultSet.getString("employee_email"));
                employee.setEmployeeAddress(resultSet.getString("employee_address"));

                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public String edit(Employee employee) {
        int row = 0;

        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "update employee \n" +
                                    "set employee_name = ?, position_id = ?, education_degree_id = ?, division_id = ?, employee_birthday = ?,\n" +
                                    "                    employee_id_card = ?,employee_salary = ?,employee_phone = ?,employee_email = ?,employee_address = ?\n" +
                                    "where employee_id = ?");
            preparedStatement.setString(1, employee.getEmployeeName());
            preparedStatement.setInt(2, employee.getPositionId());
            preparedStatement.setInt(3, employee.getEducationDegreeId());
            preparedStatement.setInt(4, employee.getDivisionId());
            preparedStatement.setString(5, employee.getEmployeeBirthday());
            preparedStatement.setString(6, employee.getEmployeeIdCard());
            preparedStatement.setDouble(7, employee.getEmployeeSalary());
            preparedStatement.setString(8, employee.getEmployeePhone());
            preparedStatement.setString(9, employee.getEmployeeEmail());
            preparedStatement.setString(10, employee.getEmployeeAddress());
            preparedStatement.setInt(11,employee.getEmployeeId());

            row = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row > 0 ? "Success" : "Fail";
    }

    @Override
    public Employee findByID(int employee_id) {
        Employee employee = null;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "select employee_id,employee_name,position_id,education_degree_id,\n" +
                                    "       division_id,employee_birthday,employee_id_card,employee_salary,\n" +
                                    "       employee_phone,employee_email,employee_address\n" +
                                    "from employee\n" +
                                    "where employee_id = ?");
            preparedStatement.setString(1, employee_id + "");
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                employee = new Employee();
                employee.setEmployeeId(employee_id);
                employee.setEmployeeName(resultSet.getString("employee_name"));
                employee.setPositionId(resultSet.getInt("position_id"));
                employee.setEducationDegreeId(resultSet.getInt("education_degree_id"));
                employee.setDivisionId(resultSet.getInt("division_id"));
                employee.setEmployeeBirthday(resultSet.getString("employee_birthday"));
                employee.setEmployeeIdCard(resultSet.getString("employee_id_card"));
                employee.setEmployeeSalary(resultSet.getDouble("employee_salary"));
                employee.setEmployeePhone(resultSet.getString("employee_phone"));
                employee.setEmployeeEmail(resultSet.getString("employee_email"));
                employee.setEmployeeAddress(resultSet.getString("employee_address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public void remove(int id) {

    }

    @Override
    public boolean create(Employee user) {
        return false;
    }
}
