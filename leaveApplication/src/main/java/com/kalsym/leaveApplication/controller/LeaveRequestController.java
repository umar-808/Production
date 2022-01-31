/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.Designation;
import com.kalsym.leaveApplication.model.LeaveRequest;
import com.kalsym.leaveApplication.service.LeaveRequestService;
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
public class LeaveRequestController {

    @Autowired
    private LeaveRequestService service;

    @GetMapping("/leave-requests")
    public List<LeaveRequest> getLeaveRequests() {
        return service.getLeaveRequests();
    }

    @GetMapping("/leave-requests/{id}")
    public ResponseEntity<LeaveRequest> getDesignationById(@PathVariable int id) {
        try {
            return new ResponseEntity<>(service.getLeaveRequestById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/leave-requests")
    public LeaveRequest addLeaveRequest(@RequestBody LeaveRequest leaveRequest) {
        return service.addLeaveRequest(leaveRequest);
    }

    @DeleteMapping("/leave-requests/{id}")
    public void deleteLeaveRequest(@PathVariable int id) {
        service.deleteLeaveRequest(id);
    }
}
