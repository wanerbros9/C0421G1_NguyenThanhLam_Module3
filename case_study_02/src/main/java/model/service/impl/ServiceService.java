package model.service.impl;

import model.bean.service.Service;
import model.repository.service_repository.IServiceRepository;
import model.repository.service_repository.ServiceRepository;
import model.service.IServiceService;

import java.util.List;

public class ServiceService implements IServiceService {

    IServiceRepository iServiceRepository = new ServiceRepository();

    @Override
    public List<Service> findAll() {
        return this.iServiceRepository.findAll();
    }

    @Override
    public String edit(Service service) {
        return this.iServiceRepository.edit(service);
    }

    @Override
    public Service findById(int serviceId) {
        return this.iServiceRepository.findById(serviceId);
    }

    @Override
    public void remove(int serviceId) {
        this.iServiceRepository.remove(serviceId);
    }

    @Override
    public boolean create(Service service) {
        return this.iServiceRepository.create(service);
    }
}
