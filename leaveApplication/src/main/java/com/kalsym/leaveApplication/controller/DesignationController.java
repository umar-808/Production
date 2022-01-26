/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.Designation;
import com.kalsym.leaveApplication.service.DesignationService;
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
public class DesignationController {

    @Autowired
    private DesignationService service;

    @GetMapping("/designations")
    public List<Designation> getDesignations() {
        return service.getDesignations();
    }

    @PostMapping("/designations")
    public Designation addDesignation(@RequestBody Designation designation) {
        return service.addDesignation(designation);
    }
}
