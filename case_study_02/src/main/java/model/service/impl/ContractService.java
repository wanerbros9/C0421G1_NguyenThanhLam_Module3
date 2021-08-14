package model.service.impl;

import model.bean.contract.Contract;
import model.bean.service.Service;
import model.repository.contract_repository.ContractRepository;
import model.repository.contract_repository.IContractRepository;
import model.service.IContractService;

import java.util.List;

public class ContractService implements IContractService {

    IContractRepository iContractRepository = new ContractRepository();

    @Override
    public List<Contract> findAll() {
        return this.iContractRepository.findAll();
    }

    @Override
    public String edit(Contract contract) {
        return null;
    }

    @Override
    public Contract findById(int contractId) {
        return null;
    }

    @Override
    public void remove(int contractId) {

    }

    @Override
    public boolean create(Contract contract) {
        return this.iContractRepository.create(contract);
    }
}
