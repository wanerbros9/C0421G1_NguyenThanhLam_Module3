package model.repository;

import model.bean.User;

import java.util.List;

public interface IUserRepository {

    List<User> findAll();

    String edit(User user);

    User findByID(int id);

    void remove(int id);

    boolean create(User user);

    List<User> findByCountry(String country);

    List<User> sortByName();
}
