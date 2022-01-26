/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.service;

import com.kalsym.leaveApplication.dao.UserRepository;
import com.kalsym.leaveApplication.model.User;
import com.kalsym.leaveApplication.model.UserPassword;
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

    public User getUserById(int id) {
        return repository.findById(id).get();
    }

    public List<User> getUsers() {
        return repository.findAll();
    }

    public User addUser(User user) {
        return repository.save(user);
    }

    public void deleteUser(int id) {
        repository.deleteById(id);
    }
}
