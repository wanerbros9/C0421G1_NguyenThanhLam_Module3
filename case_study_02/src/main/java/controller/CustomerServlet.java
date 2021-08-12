package controller;

import model.bean.customer.Customer;
import model.bean.customer.CustomerType;
import model.repository.linked_customer.CustomerTypeRepository;
import model.repository.linked_customer.ILinkedCustomerRepository;
import model.service.ICustomerService;
import model.service.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {

    ICustomerService iCustomerService = new CustomerService();
    ILinkedCustomerRepository customerTypeRepository = new CustomerTypeRepository();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                showEditCustomer(request, response);
                break;
            case "create":
                showCreateCustomer(request, response);
                break;
            default:
                showCustomerList(request, response);
        }
    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerListServlet", this.iCustomerService.findAll());
        try {
            request.getRequestDispatcher("view/customer/view-customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = new ArrayList<>();
        customerTypeList = this.customerTypeRepository.ShowAll();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/create-customer.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.iCustomerService.findById(customerId);
        request.setAttribute("customerObj", customer);
        try {
            request.getRequestDispatcher("view/customer/edit-customer.jsp").forward(request, response);
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
                editCustomer(request, response);
                break;
            case "create":
                createCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int employeeId = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.iCustomerService.findById(employeeId);
        if (customer == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            this.iCustomerService.remove(employeeId);
            showCustomerList(request, response);
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String msg = "Success";
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        boolean customerGender = Boolean.parseBoolean(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");

        Customer customer = new Customer(customerTypeId, customerName, customerBirthday, customerGender,
                customerIdCard, customerPhone, customerEmail, customerAddress);

        boolean result = this.iCustomerService.create(customer);
        try {
            if (result) {
                request.setAttribute("msg", msg);
            } else {
                request.getRequestDispatcher("error-404.jsp").forward(request, response);
            }
            request.getRequestDispatcher("view/customer/create-customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerName = request.getParameter("customerName");
        String customerBirthday = request.getParameter("customerBirthday");
        boolean customerGender = Boolean.parseBoolean(request.getParameter("customerGender"));
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");

        Customer customer = new Customer(customerId, customerTypeId, customerName, customerBirthday, customerGender,
                customerIdCard, customerPhone, customerEmail, customerAddress);

        this.iCustomerService.edit(customer);
        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("view/customer/edit-customer.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
