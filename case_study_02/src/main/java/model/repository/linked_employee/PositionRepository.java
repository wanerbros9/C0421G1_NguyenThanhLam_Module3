package model.repository.linked_employee;

import model.bean.employee.Position;
import model.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements ILinkedEmployeeRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Position> ShowAll() {
        List<Position> positionList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "SELECT * from `position` ");
            ResultSet resultSet = preparedStatement.executeQuery();

            Position position = null;
            while (resultSet.next()) {
                position = new Position();
                position.setPositionId(resultSet.getInt("position_id"));
                position.setPositionName(resultSet.getString("position_name"));

                positionList.add(position);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return positionList;
    }
}
