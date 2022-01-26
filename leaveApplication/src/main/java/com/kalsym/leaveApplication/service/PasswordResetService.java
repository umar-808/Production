/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.service;

import com.kalsym.leaveApplication.dao.PasswordResetRepository;
import com.kalsym.leaveApplication.model.PasswordReset;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class PasswordResetService {

    @Autowired
    private PasswordResetRepository repository;

    public PasswordReset getPasswordResetById(int id) {
        return repository.findById(id).get();
    }

    public List<PasswordReset> getPasswordResets() {
        return repository.findAll();
    }

    public PasswordReset addPasswordReset(PasswordReset passwordReset) {
        return repository.save(passwordReset);
    }

    public void deletePasswordReset(int id) {
        repository.deleteById(id);
    }
}
