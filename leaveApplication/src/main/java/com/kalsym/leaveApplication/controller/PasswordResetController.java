/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.PasswordReset;
import com.kalsym.leaveApplication.service.PasswordResetService;
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
public class PasswordResetController {

    @Autowired
    private PasswordResetService service;

    @GetMapping("/password-resets")
    public List<PasswordReset> getPasswordResets() {
        return service.getPasswordResets();
    }

    @PostMapping("/password-resets")
    public PasswordReset addPasswordReset(@RequestBody PasswordReset passwordReset) {
        return service.addPasswordReset(passwordReset);
    }
}
