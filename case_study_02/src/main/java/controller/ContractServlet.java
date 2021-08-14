package controller;

import model.bean.contract.Contract;
import model.service.IContractService;
import model.service.ICustomerService;
import model.service.IEmployeeService;
import model.service.IServiceService;
import model.service.impl.ContractService;
import model.service.impl.CustomerService;
import model.service.impl.EmployeeService;
import model.service.impl.ServiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {

    IContractService iContractService = new ContractService();
    IEmployeeService iEmployeeService = new EmployeeService();
    ICustomerService iCustomerService = new CustomerService();
    IServiceService iServiceService = new ServiceService();
    


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateContract(request, response);
                break;
            default:
                showContractList(request, response);
        }
    }

    private void showContractList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("contractListServlet", this.iContractService.findAll());
        try {
            request.getRequestDispatcher("view/contract/view-contract.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateContract(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/contract/create-contract.jsp").forward(request,response);
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
            case "create":
                createContract(request, response);
                break;
        }
    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) {
        String msg = "Success";
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        String contractStartDate = request.getParameter("contractStartDate");
        String contractEndDate = request.getParameter("contractEndDate");
        int contractDeposit = Integer.parseInt(request.getParameter("contractDeposit"));

        Contract contract = new Contract(employeeId, customerId, serviceId, contractStartDate, contractEndDate, contractDeposit);
        boolean result = this.iContractService.create(contract);
        try {
            if (result) {
                request.setAttribute("msg", msg);
            } else {
                request.getRequestDispatcher("error-404.jsp").forward(request, response);
            }
            request.getRequestDispatcher("view/contract/create-contract.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

