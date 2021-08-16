package model.repository.contract_repository;

import model.bean.contract.ContractDetail;

import java.util.List;

public interface IContractDetailRepository {
    List<ContractDetail> findAll();

    String edit(ContractDetail contractDetail);

    ContractDetail findById(int contractDetailId);

    void remove(int contractDetailId);

    boolean create(ContractDetail contractDetail);
}
