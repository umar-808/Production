/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.controller.leaveApplication;

import com.kalsym.applicationPortal.model.leaveApplication.Leave;
import com.kalsym.applicationPortal.service.leaveApplication.LeaveService;
import java.util.List;
import java.util.NoSuchElementException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
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
@CrossOrigin("*")
public class LeaveController {

    @Autowired
    private LeaveService service;

    @GetMapping("/leaves")
    public List<Leave> getLeaves() {
        return service.getLeaves();
    }

    @GetMapping("/leaves/{id}")
    public ResponseEntity<Leave> getLeaveById(@PathVariable long id) {
        try {
            return new ResponseEntity<>(service.getLeaveById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/leaves")
    public Leave addLeave(@RequestBody Leave leave) {
        return service.addLeave(leave);
    }

    @DeleteMapping("/leaves/{id}")
    public void deleteLeave(@PathVariable long id) {
        service.deleteLeave(id);
    }
}
