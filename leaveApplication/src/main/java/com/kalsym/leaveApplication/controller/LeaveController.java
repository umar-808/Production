/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.Leave;
import com.kalsym.leaveApplication.service.LeaveService;
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
public class LeaveController {

    @Autowired
    private LeaveService service;

    @GetMapping("/leaves")
    public List<Leave> getLeaves() {
        return service.getLeaves();
    }

    @PostMapping("/leaves")
    public Leave addLeave(@RequestBody Leave leave) {
        return service.addLeave(leave);
    }
}
