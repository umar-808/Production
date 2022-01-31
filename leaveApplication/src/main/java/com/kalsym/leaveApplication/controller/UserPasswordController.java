/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.User;
import com.kalsym.leaveApplication.model.UserPassword;
import com.kalsym.leaveApplication.service.UserPasswordService;
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
public class UserPasswordController {

    @Autowired
    private UserPasswordService service;

    @GetMapping("/user-passwords")
    public List<UserPassword> getUserPasswords() {
        return service.getUserPasswords();
    }

    @GetMapping("/user-passwords/{id}")
    public ResponseEntity<UserPassword> getDesignationById(@PathVariable int id) {
        try {
            return new ResponseEntity<>(service.getUserPasswordById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/user-passwords/{userPasswordId}/users")
    public List<User> getUsers(@PathVariable int userPasswordId) {
        return service.getUserPasswordById(userPasswordId).getUsers();
    }

    @PostMapping("/user-passwords")
    public UserPassword addUserPassword(@RequestBody UserPassword userPassword) {
        return service.addUserPassword(userPassword);
    }

    @DeleteMapping("/user-passwords/{id}")
    public void deleteUserPassword(@PathVariable int id) {
        service.deleteUserPassword(id);
    }
}
