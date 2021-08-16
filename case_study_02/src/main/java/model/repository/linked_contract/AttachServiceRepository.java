package model.repository.linked_contract;

import model.bean.contract.AttachService;
import model.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttachServiceRepository implements ILinkedContractRepository{

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List ShowAll() {
        List<AttachService> attachServiceList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "select * from attach_service");
            ResultSet resultSet = preparedStatement.executeQuery();

            AttachService attachService = null;
            while (resultSet.next()){
                attachService = new AttachService();
                attachService.setAttachServiceId(resultSet.getInt("attach_service_id"));
                attachService.setAttachServiceName(resultSet.getString("attach_service_name"));

                attachServiceList.add(attachService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return attachServiceList;
    }
}
