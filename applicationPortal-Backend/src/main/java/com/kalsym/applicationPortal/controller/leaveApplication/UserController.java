/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.controller.leaveApplication;

import com.kalsym.applicationPortal.model.Department;
import com.kalsym.applicationPortal.model.leaveApplication.Designation;
import com.kalsym.applicationPortal.model.leaveApplication.LeaveRequest;
import com.kalsym.applicationPortal.model.leaveApplication.User;
import com.kalsym.applicationPortal.service.leaveApplication.UserService;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author kalsym
 */
@RestController
@CrossOrigin("*")
public class UserController {

    @Autowired
    private UserService service;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @GetMapping("/users")
    public List<User> getUsers() {
        return service.getUsers();
    }

    @GetMapping("/users/{id}")
    public ResponseEntity<User> getUserById(@PathVariable long id) {
        try {
            return new ResponseEntity<>(service.getUserById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/users/{userId}/leave-requests")
    public List<LeaveRequest> getLeaveRequests(@PathVariable long userId) {
        return service.getUserById(userId).getLeaveRequests();
    }

    @GetMapping("/users/{userId}/designation")
    public Designation getDesignation(@PathVariable long userId) {
        return service.getUserById(userId).getDesignation();
    }

    @GetMapping("/users/{userId}/department")
    public Department getDepartment(@PathVariable long userId) {
        return service.getUserById(userId).getDepartment();
    }

    @PostMapping("/users")
    public User addUser(@RequestBody User user) {
        user.setPassword(encoder.encode(user.getPassword()));
        return service.addUser(user);
    }

    @PutMapping("/users/{id}/reset-password")
    public User resetPassword(@PathVariable long id, @RequestBody User user) {
        User temp = service.getUserById(id);
        temp.setPassword(encoder.encode(user.getPassword()));
        return service.addUser(temp);
    }

    @DeleteMapping("/users/{id}")
    public void deleteUser(@PathVariable long id) {
        service.deleteUser(id);
    }
}
