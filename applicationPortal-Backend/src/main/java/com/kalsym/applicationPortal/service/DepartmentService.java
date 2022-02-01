/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service;

import com.kalsym.applicationPortal.dao.DepartmentRepository;
import com.kalsym.applicationPortal.model.Department;
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

    public Department getDepartmentById(long id) {
        return repository.findById(id).get();
    }

    public List<Department> getDepartments() {
        return repository.findAll();
    }

    public Department getDepartmentByName(String name) {
        return repository.findByName(name);
    }

    public Department addDepartment(Department department) {
        return repository.save(department);
    }

    public void deleteDepartmentById(long id) {
        repository.deleteById(id);
    }
}
