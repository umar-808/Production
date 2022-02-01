/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.controller.leaveApplication;
import com.kalsym.applicationPortal.model.leaveApplication.Designation;
import com.kalsym.applicationPortal.model.leaveApplication.User;
import com.kalsym.applicationPortal.service.leaveApplication.DesignationService;
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
public class DesignationController {

    @Autowired
    private DesignationService service;

    @GetMapping("/designations")
    public List<Designation> getDesignations() {
        return service.getDesignations();
    }

    @GetMapping("/designations/{id}")
    public ResponseEntity<Designation> getDesignationById(@PathVariable int id) {
        try {
            return new ResponseEntity<>(service.getDesignationById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/designations/{designationId}/users")
    public List<User> getUsers(@PathVariable int designationId) {
        return service.getDesignationById(designationId).getUsers();
    }

    @PostMapping("/designations")
    public Designation addDesignation(@RequestBody Designation designation) {
        return service.addDesignation(designation);
    }

    @DeleteMapping("/designations/{id}")
    public void deleteDesignations(@PathVariable int id) {
        service.deleteDesignation(id);
    }
}
