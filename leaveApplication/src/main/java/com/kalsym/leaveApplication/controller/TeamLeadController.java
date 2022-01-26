/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.TeamLead;
import com.kalsym.leaveApplication.service.TeamLeadService;
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
public class TeamLeadController {

    @Autowired
    private TeamLeadService service;

    @GetMapping("/team-leads")
    public List<TeamLead> getTeamLeads() {
        return service.getTeamLeads();
    }

    @PostMapping("team-leads")
    public TeamLead addTeamLead(@RequestBody TeamLead teamlead) {
        return service.addTeamLead(teamlead);
    }
}
