package model.repository.service_repository;

import model.bean.service.Service;
import model.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements IServiceRepository {

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Service> findAll() {
        List<Service> serviceList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select * from service");
            ResultSet resultSet = preparedStatement.executeQuery();

            Service service = new Service();
            while (resultSet.next()) {
                service = new Service();
                service.setServiceId(resultSet.getInt("service_id"));
                service.setServiceName(resultSet.getString("service_name"));
                service.setServiceArea(resultSet.getInt("service_area"));
                service.setServiceCost(resultSet.getDouble("service_cost"));
                service.setServiceMaxPeople(resultSet.getString("service_max_people"));
                service.setRentTypeId(resultSet.getInt("rent_type_id"));
                service.setServiceTypeId(resultSet.getInt("service_type_id"));
                service.setStandardRoom(resultSet.getString("standard_room"));
                service.setDescriptionOtherConvenience(resultSet.getString("description_other_convenience"));
                service.setPoolArea(resultSet.getInt("pool_area"));
                service.setNumberOfFloors(resultSet.getInt("number_of_floors"));

                serviceList.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public String edit(Service service) {
        return null;
    }

    @Override
    public Service findById(int serviceId) {
        return null;
    }

    @Override
    public void remove(int serviceId) {

    }

    @Override
    public boolean create(Service service) {
        int row = 0;
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "insert into service(service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,\n" +
                                    "                    standard_room,description_other_convenience,pool_area,number_of_floors)\n" +
                                    "value (?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, service.getServiceName());
            preparedStatement.setString(2, service.getServiceArea() + "");
            preparedStatement.setString(3, service.getServiceCost() + "");
            preparedStatement.setString(4, service.getServiceMaxPeople());
            preparedStatement.setString(5, service.getRentTypeId() + "");
            preparedStatement.setString(6, service.getServiceTypeId() + "");
            preparedStatement.setString(7, service.getStandardRoom());
            preparedStatement.setString(8, service.getDescriptionOtherConvenience());
            preparedStatement.setString(9, service.getPoolArea() + "");
            preparedStatement.setString(10, service.getNumberOfFloors() + "");
            row = preparedStatement.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
