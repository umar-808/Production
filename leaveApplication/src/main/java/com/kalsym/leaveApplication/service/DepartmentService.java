/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.service;

import com.kalsym.leaveApplication.dao.DepartmentRepository;
import com.kalsym.leaveApplication.model.Department;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class DepartmentService {
    
    @Autowired
    private DepartmentRepository repository;
    
    public Department getDepartmentById(int id) {
        return repository.findById(id).get();
    }
    
    public List<Department> getDepartments() {
        return repository.findAll();
    }
    
    public Department addDepartment(Department department) {
        return repository.save(department);
    }
    
    public void deleteDepartment(int id) {
        repository.deleteById(id);
    }
}
