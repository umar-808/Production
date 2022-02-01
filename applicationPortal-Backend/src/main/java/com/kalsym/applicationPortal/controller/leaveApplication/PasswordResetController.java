/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.controller.leaveApplication;

import com.kalsym.applicationPortal.model.leaveApplication.PasswordReset;
import com.kalsym.applicationPortal.service.leaveApplication.PasswordResetService;
import java.util.List;
import java.util.NoSuchElementException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    @GetMapping("/password-resets/{id}")
    public ResponseEntity<PasswordReset> getDesignationById(@PathVariable int id) {
        try {
            return new ResponseEntity<>(service.getPasswordResetById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/password-resets")
    public PasswordReset addPasswordReset(@RequestBody PasswordReset passwordReset) {
        return service.addPasswordReset(passwordReset);
    }

    @DeleteMapping("/password-resets/{id}")
    public void deletePasswordReset(@PathVariable int id) {
        service.deletePasswordReset(id);
    }
}
