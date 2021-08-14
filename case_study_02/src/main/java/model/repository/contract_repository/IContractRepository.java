package model.repository.contract_repository;

import model.bean.contract.Contract;

import java.util.List;

public interface IContractRepository {
    List<Contract> findAll();

    String edit(Contract contract);

    Contract findById(int contractId);

    void remove(int contractId);

    boolean create(Contract contract);
}
