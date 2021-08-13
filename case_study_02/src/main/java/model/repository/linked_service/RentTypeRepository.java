package model.repository.linked_service;

import model.bean.service.RentType;
import model.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements ILinkedServiceRepository {

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List ShowAll() {
        List<RentType> rentTypeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "select * from rent_type");
            ResultSet resultSet = preparedStatement.executeQuery();

            RentType rentType = null;
            while (resultSet.next()) {
                rentType = new RentType();
                rentType.setRentTypeId(resultSet.getInt("rent_type_id"));
                rentType.setRentTypeName(resultSet.getString("rent_type_name"));

                rentTypeList.add(rentType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeList;
    }
}
