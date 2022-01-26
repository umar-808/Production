/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.LeaveRequest;
import com.kalsym.leaveApplication.service.LeaveRequestService;
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
public class LeaveRequestController {

    @Autowired
    private LeaveRequestService service;

    @GetMapping("/leave-requests")
    public List<LeaveRequest> getLeaveRequests() {
        return service.getLeaveRequests();
    }

    @PostMapping("/leave-requests")
    public LeaveRequest addLeaveRequest(@RequestBody LeaveRequest leaveRequest) {
        return service.addLeaveRequest(leaveRequest);
    }
}
