/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.JobApplicationForm.controller;

import com.kalsym.JobApplicationForm.model.Department;
import com.kalsym.JobApplicationForm.service.DepartmentService;
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
    private DepartmentService departmentService;
    
    @GetMapping("/departments")
    public List<Department> getDepartments() {
        return departmentService.getDepartments();
    }
    
    @GetMapping("/departments/{id}")
    public ResponseEntity<Department> getDepartmentById(@PathVariable Long id) {
        try {
            return new ResponseEntity<>(departmentService.getDepartmentById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    
    @PostMapping("/departments")
    public Department add(@RequestBody Department department) {
        return departmentService.saveDepartment(department);
    }
    
    @DeleteMapping("/departments/{id}")
    public void deleteDepartment(@PathVariable Long id) {
        departmentService.deleteDepartmentById(id);
    }
}
