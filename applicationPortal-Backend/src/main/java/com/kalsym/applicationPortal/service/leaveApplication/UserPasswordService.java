/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service.leaveApplication;

import com.kalsym.applicationPortal.dao.leaveApplication.UserPasswordRepository;
import com.kalsym.applicationPortal.model.leaveApplication.UserPassword;
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

    public UserPassword getUserPasswordById(long id) {
        return repository.findById(id).get();
    }

    public List<UserPassword> getUserPasswords() {
        return repository.findAll();
    }

    public UserPassword addUserPassword(UserPassword userPassword) {
        return repository.save(userPassword);
    }

    public void deleteUserPassword(long id) {
        repository.deleteById(id);
    }
}
