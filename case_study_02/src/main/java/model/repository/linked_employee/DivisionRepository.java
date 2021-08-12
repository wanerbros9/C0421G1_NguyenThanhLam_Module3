package model.repository.linked_employee;

import model.bean.employee.Division;
import model.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements ILinkedEmployeeRepository {

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List ShowAll() {
        List<Division> divisionList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "SELECT * from `division` ");
            ResultSet resultSet = preparedStatement.executeQuery();

            Division division = null;
            while (resultSet.next()) {
                division = new Division();
                division.setDivisionId(resultSet.getInt("division_id"));
                division.setDivisionName(resultSet.getString("division_name"));

                divisionList.add(division);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return divisionList;
    }
}
