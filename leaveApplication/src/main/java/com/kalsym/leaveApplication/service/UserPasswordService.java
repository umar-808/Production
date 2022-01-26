/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.service;

import com.kalsym.leaveApplication.dao.UserPasswordRepository;
import com.kalsym.leaveApplication.model.TeamLead;
import com.kalsym.leaveApplication.model.UserPassword;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class UserPasswordService {

    @Autowired
    private UserPasswordRepository repository;

    public UserPassword getUserPasswordById(int id) {
        return repository.findById(id).get();
    }

    public List<UserPassword> getUserPasswords() {
        return repository.findAll();
    }

    public UserPassword addUserPassword(UserPassword userPassword) {
        return repository.save(userPassword);
    }

    public void deleteUserPassword(int id) {
        repository.deleteById(id);
    }
}
