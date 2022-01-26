/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.jobApplication.service.jobApplication;

import com.kalsym.jobApplication.dao.jobApplication.AdminRepository;
import com.kalsym.jobApplication.model.jobApplication.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class AdminService {

    @Autowired
    private AdminRepository repository;

    public Admin findByUsername(Admin admin) {
        return repository.findByUsername(admin.getUsername());
    }
}
