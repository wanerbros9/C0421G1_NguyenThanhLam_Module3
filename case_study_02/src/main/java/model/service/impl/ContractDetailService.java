package model.service.impl;

import model.repository.contract_repository.ContractDetailRepository;
import model.repository.contract_repository.IContractDetailRepository;
import model.service.IContractDetailService;

import java.util.List;

public class ContractDetailService implements IContractDetailService {

    IContractDetailRepository iContractDetailRepository = new ContractDetailRepository();

    @Override
    public List<model.bean.contract.ContractDetail> findAll() {
        return this.iContractDetailRepository.findAll();
    }

    @Override
    public String edit(model.bean.contract.ContractDetail contractDetail) {
        return null;
    }

    @Override
    public model.bean.contract.ContractDetail findById(int contractDetailId) {
        return null;
    }

    @Override
    public void remove(int contractDetailId) {

    }

    @Override
    public boolean create(model.bean.contract.ContractDetail contractDetail) {
        return false;
    }
}
