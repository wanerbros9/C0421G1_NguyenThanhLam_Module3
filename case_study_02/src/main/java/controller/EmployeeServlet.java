package controller;

import model.bean.employee.Division;
import model.bean.employee.EducationDegree;
import model.bean.employee.Employee;
import model.bean.employee.Position;
import model.repository.linked_employee.DivisionRepository;
import model.repository.linked_employee.EducationDegreeRepository;
import model.repository.linked_employee.ILinkedEmployeeRepository;
import model.repository.linked_employee.PositionRepository;
import model.service.IEmployeeService;
import model.service.impl.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/employee"})
public class EmployeeServlet extends HttpServlet {

    IEmployeeService iEmployeeService = new EmployeeService();
    ILinkedEmployeeRepository positionRepository = new PositionRepository();
    ILinkedEmployeeRepository divisionRepository = new DivisionRepository();
    ILinkedEmployeeRepository educationDegreeRepository = new EducationDegreeRepository();

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
            case "create":
                showCreateEmployee(request, response);
                break;
            default:
                showEmployeeList(request, response);
                break;
        }
    }

    private void showCreateEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positionList = new ArrayList<>();
        positionList = this.positionRepository.ShowAll();
        request.setAttribute("positionList", positionList);

        List<EducationDegree> educationDegreeList = new ArrayList<>();
        educationDegreeList = this.educationDegreeRepository.ShowAll();
        request.setAttribute("educationDegreeList", educationDegreeList);

        List<Division> divisionList = new ArrayList<>();
        divisionList = this.divisionRepository.ShowAll();
        request.setAttribute("divisionList", divisionList);

        try {
            request.getRequestDispatcher("view/employee/create-employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("id"));
        Employee employee = this.iEmployeeService.findByID(employeeId);
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
            case "create":
                createEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = this.iEmployeeService.findByID(id);
        if (employee == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            this.iEmployeeService.remove(id);
            showEmployeeList(request, response);
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        String msg = "Success";
        String employeeName = request.getParameter("employeeName");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        Double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        Employee employee = new Employee(employeeName, positionId, educationDegreeId, divisionId, employeeBirthday, employeeIdCard,
                employeeSalary, employeePhone, employeeEmail, employeeAddress);
        boolean result = this.iEmployeeService.create(employee);
        try {
            if (result) {
                request.setAttribute("msg", msg);
            } else {
                request.getRequestDispatcher("error-404.jsp").forward(request, response);
            }
            request.getRequestDispatcher("view/employee/create-employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        String employeeName = request.getParameter("employeeName");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        Double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        String message = "Success";

        Employee employee = new Employee(employeeId, employeeName, positionId, educationDegreeId, divisionId,
                employeeBirthday, employeeIdCard, employeeSalary, employeePhone, employeeEmail, employeeAddress);

        this.iEmployeeService.edit(employee);
        request.setAttribute("employee", employee);
        try {
            request.getRequestDispatcher("view/employee/edit-employee.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
