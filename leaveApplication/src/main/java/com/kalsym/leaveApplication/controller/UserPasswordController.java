/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.UserPassword;
import com.kalsym.leaveApplication.service.UserPasswordService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author kalsym
 */
@RestController
public class UserPasswordController {

    @Autowired
    private UserPasswordService service;

    @GetMapping("/user-passwords")
    public List<UserPassword> getUserPasswords() {
        return service.getUserPasswords();
    }

    @PostMapping("/user-passwords")
    public UserPassword addUserPassword(@RequestBody UserPassword userPassword) {
        return service.addUserPassword(userPassword);
    }
}
