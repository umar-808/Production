/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.service;

import com.kalsym.leaveApplication.dao.TeamLeadRepository;
import com.kalsym.leaveApplication.model.Migration;
import com.kalsym.leaveApplication.model.TeamLead;
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

    public TeamLead getTeamLeadById(int id) {
        return repository.findById(id).get();
    }

    public List<TeamLead> getTeamLeads() {
        return repository.findAll();
    }

    public TeamLead addTeamLead(TeamLead teamLead) {
        return repository.save(teamLead);
    }

    public void deleteTeamLead(int id) {
        repository.deleteById(id);
    }
}
