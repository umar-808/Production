/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service.leaveApplication;

import com.kalsym.applicationPortal.dao.leaveApplication.UserRepository;
import com.kalsym.applicationPortal.model.leaveApplication.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class UserService {

    @Autowired
    private UserRepository repository;

    public User getUserById(long id) {
        return repository.findById(id).get();
    }

    public User getUserByUsername(String username) {
        return repository.findByUsername(username);
    }

    public List<User> getUsers() {
        return repository.findAll();
    }

    public User addUser(User user) {
        return repository.save(user);
    }

    public void deleteUser(long id) {
        repository.deleteById(id);
    }
}
