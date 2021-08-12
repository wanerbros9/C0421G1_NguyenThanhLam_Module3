package model.repository.linked_employee;

import model.bean.employee.EducationDegree;
import model.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements ILinkedEmployeeRepository {

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List ShowAll() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "SELECT * from education_degree ");
            ResultSet resultSet = preparedStatement.executeQuery();

            EducationDegree educationDegree = null;
            while (resultSet.next()) {
                educationDegree = new EducationDegree();
                educationDegree.setEducationDegreeId(resultSet.getInt("education_degree_id"));
                educationDegree.setEducationDegreeName(resultSet.getString("education_degree_name"));

                educationDegreeList.add(educationDegree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return educationDegreeList;
    }
}
