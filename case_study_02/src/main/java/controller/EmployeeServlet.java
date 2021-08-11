package controller;

import model.bean.Employee;
import model.service.IEmployeeService;
import model.service.impl.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/employee"})
public class EmployeeServlet extends HttpServlet {

    IEmployeeService iEmployeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                showEditEmployee(request, response);
                break;
            default:
                showEmployeeList(request, response);
                break;
        }
    }

    private void showEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employee_id = Integer.parseInt(request.getParameter("id"));
        Employee employee = this.iEmployeeService.findByID(employee_id);
        request.setAttribute("employeeObj", employee);
        try {
            request.getRequestDispatcher("view/employee/edit-employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEmployeeList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("employeeListServlet", this.iEmployeeService.findAll());
        try {
            request.getRequestDispatcher("view/employee/view-employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                editEmployee(request, response);
                break;
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employee_id = Integer.parseInt(request.getParameter("employee_id"));
        String employee_name = request.getParameter("employee_name");
        int position_id = Integer.parseInt(request.getParameter("position_id"));
        int education_degree_id = Integer.parseInt(request.getParameter("education_degree_id"));
        int division_id = Integer.parseInt(request.getParameter("division_id"));
        String employee_birthday = request.getParameter("employee_birthday");
        String employee_id_card = request.getParameter("employee_id_card");
        Double employee_salary = Double.parseDouble(request.getParameter("employee_salary"));
        String employee_phone = request.getParameter("employee_phone");
        String employee_email = request.getParameter("employee_email");
        String employee_address = request.getParameter("employee_address");
        String message = "";

        Employee employee = new Employee(employee_id,employee_name,position_id,education_degree_id,division_id,
                employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address);

        this.iEmployeeService.edit(employee);
        request.setAttribute("employee",employee);
        try {
            request.getRequestDispatcher("view/employee/edit-employee.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

//        Employee employee = this.iEmployeeService.findByID(id);
//        RequestDispatcher dispatcher;
//        if (employee == null) {
//            dispatcher = request.getRequestDispatcher("error-404.jsp");
//        } else {
//            employee.setEmployeeName(employee_name);
//            employee.setPositionId(position_id);
//            employee.setEducationDegreeId(education_degree_id);
//            employee.setDivisionId(division_id);
//            employee.setEmployeeBirthday(employee_birthday);
//            employee.setEmployeeIdCard(employee_id_card);
//            employee.setEmployeeSalary(employee_salary);
//            employee.setEmployeePhone(employee_phone);
//            employee.setEmployeeEmail(employee_email);
//            employee.setEmployeeAddress(employee_address);
//            message = this.iEmployeeService.edit(employee);
//            request.setAttribute("employee",employee);
//            request.setAttribute("message", message);
//            try {
//                request.getRequestDispatcher("view/employee/edit-employee.jsp").forward(request,response);
//            } catch (ServletException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
    }
}
