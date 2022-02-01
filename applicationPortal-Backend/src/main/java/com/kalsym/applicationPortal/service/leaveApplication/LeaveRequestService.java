/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service.leaveApplication;

import com.kalsym.applicationPortal.dao.leaveApplication.LeaveRequestRepository;
import com.kalsym.applicationPortal.model.leaveApplication.LeaveRequest;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class LeaveRequestService {

    @Autowired
    private LeaveRequestRepository repository;

    public LeaveRequest getLeaveRequestById(int id) {
        return repository.findById(id).get();
    }

    public List<LeaveRequest> getLeaveRequests() {
        return repository.findAll();
    }

    public LeaveRequest addLeaveRequest(LeaveRequest leaveRequest) {
        return repository.save(leaveRequest);
    }

    public void deleteLeaveRequest(int id) {
        repository.deleteById(id);
    }
}
