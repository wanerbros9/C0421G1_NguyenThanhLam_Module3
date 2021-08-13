package model.repository.linked_service;

import model.bean.service.ServiceType;
import model.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepository implements ILinkedServiceRepository {

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List ShowAll() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "select * from service_type");
            ResultSet resultSet = preparedStatement.executeQuery();
            ServiceType serviceType = null;
            while (resultSet.next()){
                serviceType = new ServiceType();
                serviceType.setServiceTypeId(resultSet.getInt("service_type_id"));
                serviceType.setServiceTypeName(resultSet.getString("service_type_name"));

                serviceTypeList.add(serviceType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceTypeList;
    }
}
