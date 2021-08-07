package model.service.iplm;

import model.bean.User;
import model.repository.IUserRepository;
import model.repository.UserRepository;
import model.service.IUserService;

import java.util.List;

public class UserService implements IUserService {

    IUserRepository iUserRepository = new UserRepository();

    @Override
    public List<User> findAll() {
        return iUserRepository.findAll();
    }

    @Override
    public String edit(User user) {
        String msg = null;
        if (user.getName().matches("[A-Za-z ]+")){
            msg = this.iUserRepository.edit(user);
        }else{
            msg = "fail";
        }
        return msg;
    }

    @Override
    public User findByID(int id) {
        return iUserRepository.findByID(id);
    }

    @Override
    public void remove(int id) {
        this.iUserRepository.remove(id);
    }

    @Override
    public boolean create(User user) {
        return this.iUserRepository.create(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return iUserRepository.findByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return iUserRepository.sortByName();
    }
}
