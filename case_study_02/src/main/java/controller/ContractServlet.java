package controller;

import model.bean.contract.AttachService;
import model.bean.contract.Contract;
import model.bean.contract.ContractDetail;
import model.repository.linked_contract.AttachServiceRepository;
import model.repository.linked_contract.ILinkedContractRepository;
import model.service.*;
import model.service.impl.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {

    IContractService iContractService = new ContractService();
    IContractDetailService iContractDetailService = new ContractDetailService();
    IEmployeeService iEmployeeService = new EmployeeService();
    ICustomerService iCustomerService = new CustomerService();
    IServiceService iServiceService = new ServiceService();
    ILinkedContractRepository attachServiceRepository = new AttachServiceRepository();


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
            case "createDetail":
                showCreateContractDetail(request, response);
                break;
            default:
                showContractList(request, response);
        }
    }

    private void showCreateContractDetail(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("contractList", this.iContractService.findAll());
        List<AttachService> attachServiceList = new ArrayList<>();
        attachServiceList = this.attachServiceRepository.ShowAll();
        request.setAttribute("attachServiceList", attachServiceList);

        try {
            request.getRequestDispatcher("view/contract/create-detail.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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
        request.setAttribute("employeeList", this.iEmployeeService.findAll());
        request.setAttribute("customerList", this.iCustomerService.findAll());
        request.setAttribute("serviceList", this.iServiceService.findAll());

        try {
            request.getRequestDispatcher("view/contract/create-contract.jsp").forward(request, response);
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
            case "createDetail":
                createContractDetail(request, response);
                break;
        }
    }

    private void createContractDetail(HttpServletRequest request, HttpServletResponse response) {
        String msg = "Success";
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        int attachServiceId = Integer.parseInt(request.getParameter("attachServiceId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ContractDetail contractDetail = new ContractDetail(contractId, attachServiceId, quantity);
        boolean result = this.iContractDetailService.create(contractDetail);
        try {
            if (result) {
                request.setAttribute("msg", msg);
            } else {
                request.getRequestDispatcher("error-404.jsp").forward(request, response);
            }
            request.getRequestDispatcher("view/contract/create-detail.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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

