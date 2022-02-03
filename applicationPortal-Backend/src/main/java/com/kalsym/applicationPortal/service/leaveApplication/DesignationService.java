/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service.leaveApplication;

import com.kalsym.applicationPortal.dao.leaveApplication.DesignationRepository;
import com.kalsym.applicationPortal.model.leaveApplication.Designation;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class DesignationService {

    @Autowired
    private DesignationRepository repository;

    public Designation getDesignationById(long id) {
        return repository.findById(id).get();
    }

    public List<Designation> getDesignations() {
        return repository.findAll();
    }

    public Designation addDesignation(Designation designation) {
        return repository.save(designation);
    }

    public void deleteDesignation(long id) {
        repository.deleteById(id);
    }
}
