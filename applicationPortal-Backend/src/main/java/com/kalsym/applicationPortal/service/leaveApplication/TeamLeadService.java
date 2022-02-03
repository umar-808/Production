/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service.leaveApplication;

import com.kalsym.applicationPortal.dao.leaveApplication.TeamLeadRepository;
import com.kalsym.applicationPortal.model.leaveApplication.TeamLead;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class TeamLeadService {

    @Autowired
    private TeamLeadRepository repository;

    public TeamLead getTeamLeadById(long id) {
        return repository.findById(id).get();
    }

    public List<TeamLead> getTeamLeads() {
        return repository.findAll();
    }

    public TeamLead addTeamLead(TeamLead teamLead) {
        return repository.save(teamLead);
    }

    public void deleteTeamLead(long id) {
        repository.deleteById(id);
    }
}
