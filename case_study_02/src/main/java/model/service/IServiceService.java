package model.service;

import model.bean.service.Service;

import java.util.List;

public interface IServiceService {
    List<Service> findAll();

    String edit(Service service);

    Service findById(int serviceId);

    void remove(int serviceId);

    boolean create(Service service);
}
