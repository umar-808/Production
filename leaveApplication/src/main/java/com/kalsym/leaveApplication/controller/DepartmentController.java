/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.Department;
import com.kalsym.leaveApplication.model.Designation;
import com.kalsym.leaveApplication.model.TeamLead;
import com.kalsym.leaveApplication.model.User;
import com.kalsym.leaveApplication.service.DepartmentService;
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
public class DepartmentController {

    @Autowired
    private DepartmentService service;

    @GetMapping("/departments")
    public List<Department> getDepartments() {
        return service.getDepartments();
    }

    @GetMapping("/departments/{id}")
    public ResponseEntity<Department> getDepartmentById(@PathVariable int id) {
        try {
            return new ResponseEntity<>(service.getDepartmentById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/departments/{departmentId}/designations")
    public List<Designation> getDesignations(@PathVariable int departmentId) {
        return service.getDepartmentById(departmentId).getDesignations();
    }

    @GetMapping("/departments/{departmentId}/users")
    public List<User> getUsers(@PathVariable int departmentId) {
        return service.getDepartmentById(departmentId).getUsers();
    }

    @GetMapping("/departments/{departmentId}/team-leads")
    public List<TeamLead> getTeamLeads(@PathVariable int departmentId) {
        return service.getDepartmentById(departmentId).getTeamLeads();
    }

    @PostMapping("/departments")
    public Department addDepartment(@RequestBody Department department) {
        return service.addDepartment(department);
    }

    @DeleteMapping("/departments/{id}")
    public void deleteDepartment(@PathVariable int id) {
        service.deleteDepartment(id);
    }
}
