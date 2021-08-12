package model.repository.linked_customer;

import model.bean.customer.CustomerType;
import model.repository.BaseRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ILinkedCustomerRepository {
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List ShowAll() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement =
                    this.baseRepository.getConnection().prepareStatement(
                            "select * from customer_type");
            ResultSet resultSet = preparedStatement.executeQuery();

            CustomerType customerType = null;
            while (resultSet.next()) {
                customerType = new CustomerType();
                customerType.setCustomerTypeId(resultSet.getInt("customer_type_id"));
                customerType.setCustomerTypeName(resultSet.getString("customer_type_name"));

                customerTypeList.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }
}
