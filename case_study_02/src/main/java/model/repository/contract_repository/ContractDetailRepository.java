package model.repository.contract_repository;

import model.bean.contract.ContractDetail;
import model.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailRepository implements IContractDetailRepository {

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<ContractDetail> findAll() {
        List<ContractDetail> contractDetailList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select * from contract_detail");
            ResultSet resultSet = preparedStatement.executeQuery();

            ContractDetail contractDetail = new ContractDetail();
            while (resultSet.next()) {
                contractDetail = new ContractDetail();
                contractDetail.setContractDetailId(resultSet.getInt("contract_detail_id"));
                contractDetail.setContractId(resultSet.getInt("contract_id"));
                contractDetail.setAttachServiceId(resultSet.getInt("attach_service_id"));
                contractDetail.setQuantity(resultSet.getInt("quantity"));

                contractDetailList.add(contractDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetailList;
    }

    @Override
    public String edit(ContractDetail contractDetail) {
        return null;
    }

    @Override
    public ContractDetail findById(int contractDetailId) {
        return null;
    }

    @Override
    public void remove(int contractDetailId) {

    }

    @Override
    public boolean create(ContractDetail contractDetail) {
        return false;
    }
}
