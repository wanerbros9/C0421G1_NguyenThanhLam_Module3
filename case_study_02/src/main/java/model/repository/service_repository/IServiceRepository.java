package model.repository.service_repository;

import model.bean.customer.Customer;
import model.bean.service.Service;

import java.util.List;

public interface IServiceRepository {
    List<Service> findAll();

    String edit(Service service);

    Service findById(int serviceId);

    void remove(int serviceId);

    boolean create(Service service);
}
