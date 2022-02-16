/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.controller.leaveApplication;

import com.kalsym.applicationPortal.model.leaveApplication.LeaveRequest;
import com.kalsym.applicationPortal.service.leaveApplication.LeaveRequestService;
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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author kalsym
 */
@RestController
@CrossOrigin("*")
public class LeaveRequestController {
    
    @Autowired
    private LeaveRequestService service;
    
    @GetMapping("/leave-requests")
    public List<LeaveRequest> getLeaveRequests() {
        return service.getLeaveRequests();
    }
    
    @GetMapping("/leave-requests/{id}")
    public ResponseEntity<LeaveRequest> getDesignationById(@PathVariable long id) {
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
    
    @PutMapping("/leave-requests/{id}")
    public LeaveRequest updateLeaveRequest(@PathVariable long id, @RequestBody LeaveRequest leaveRequest) {
        LeaveRequest lr = service.getLeaveRequestById(id);
        lr.setStatus(leaveRequest.getStatus());
        lr.setAdminComment(leaveRequest.getAdminComment());
        lr.setComment(leaveRequest.getComment());
        return service.updateLeaveRequest(lr);
    }
    
    @DeleteMapping("/leave-requests/{id}")
    public void deleteLeaveRequest(@PathVariable long id) {
        service.deleteLeaveRequest(id);
    }
}
