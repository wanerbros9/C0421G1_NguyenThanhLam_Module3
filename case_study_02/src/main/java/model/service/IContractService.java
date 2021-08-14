package model.service;

import model.bean.contract.Contract;

import java.util.List;

public interface IContractService {
    List<Contract> findAll();

    String edit(Contract contract);

    Contract findById(int contractId);

    void remove(int contractId);

    boolean create(Contract contract);
}
