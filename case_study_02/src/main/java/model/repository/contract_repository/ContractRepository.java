package model.repository.contract_repository;

import model.bean.contract.Contract;
import model.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Contract> findAll() {
        List<Contract> contractList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select *from contract");
            ResultSet resultSet = preparedStatement.executeQuery();

            Contract contract = new Contract();
            while (resultSet.next()) {
                contract = new Contract();
                contract.setContractId(resultSet.getInt("contract_id"));
                contract.setEmployeeId(resultSet.getInt("employee_id"));
                contract.setCustomerId(resultSet.getInt("customer_id"));
                contract.setServiceId(resultSet.getInt("service_id"));
                contract.setContractStartDate(resultSet.getString("contract_start_date"));
                contract.setContractEndDate(resultSet.getString("contract_end_date"));
                contract.setContractDeposit(resultSet.getInt("contract_deposit"));

                contractList.add(contract);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractList;
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
        int row = 0;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "insert into contract(employee_id,customer_id,service_id,contract_start_date,\n" +
                                    "contract_end_date,contract_deposit)\n" +
                                    "value (?,?,?,?,?,?)");

            preparedStatement.setString(1,contract.getEmployeeId()+"");
            preparedStatement.setString(2,contract.getCustomerId()+"");
            preparedStatement.setString(3,contract.getServiceId()+"");
            preparedStatement.setString(4,contract.getContractStartDate());
            preparedStatement.setString(5,contract.getContractEndDate());
            preparedStatement.setString(6,contract.getContractDeposit()+"");
            row = preparedStatement.executeUpdate();
            if (row > 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

