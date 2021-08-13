package controller;

import model.bean.service.RentType;
import model.bean.service.Service;
import model.bean.service.ServiceType;
import model.repository.linked_service.ILinkedServiceRepository;
import model.repository.linked_service.RentTypeRepository;
import model.repository.linked_service.ServiceTypeRepository;
import model.service.IServiceService;
import model.service.impl.ServiceService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {

    IServiceService iServiceService = new ServiceService();
    ILinkedServiceRepository rentTypeRepository = new RentTypeRepository();
    ILinkedServiceRepository serviceTypeRepository = new ServiceTypeRepository();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateService(request, response);
                break;
            default:
                showServiceList(request, response);
        }

    }

    private void showCreateService(HttpServletRequest request, HttpServletResponse response) {
        List<RentType> rentTypeList = new ArrayList<>();
        rentTypeList = this.rentTypeRepository.ShowAll();
        request.setAttribute("rentTypeList", rentTypeList);

        List<ServiceType> serviceTypeList = new ArrayList<>();
        serviceTypeList = this.serviceTypeRepository.ShowAll();
        request.setAttribute("serviceTypeList", serviceTypeList);
        try {
            request.getRequestDispatcher("view/service/create-service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showServiceList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("serviceListServlet", this.iServiceService.findAll());
        try {
            request.getRequestDispatcher("view/service/view-service.jsp").forward(request, response);
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
                createService(request, response);
                break;
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {
        String msg = "Success";
        String serviceName = request.getParameter("serviceName");
        int serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        String serviceMaxPeople = request.getParameter("serviceMaxPeople");
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        int poolArea = Integer.parseInt(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));

        Service service = new Service(serviceName, serviceArea, serviceCost, serviceMaxPeople, rentTypeId,
                serviceTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors);
        boolean result = this.iServiceService.create(service);
        try {
            if (result) {
                request.setAttribute("msg", msg);
            } else {
                request.getRequestDispatcher("error-404.jsp").forward(request, response);
            }
            request.getRequestDispatcher("view/service/create-service.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
