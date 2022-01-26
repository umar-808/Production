/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.service;

import com.kalsym.leaveApplication.dao.LeaveRepository;
import com.kalsym.leaveApplication.model.Leave;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class LeaveService {

    @Autowired
    private LeaveRepository repository;

    public Leave getLeaveById(int id) {
        return repository.findById(id).get();
    }

    public List<Leave> getLeaves() {
        return repository.findAll();
    }

    public Leave addLeave(Leave leave) {
        return repository.save(leave);
    }

    public void deleteLeave(int id) {
        repository.deleteById(id);
    }
}
