/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.TeamLead;
import com.kalsym.leaveApplication.service.TeamLeadService;
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
public class TeamLeadController {

    @Autowired
    private TeamLeadService service;

    @GetMapping("/team-leads")
    public List<TeamLead> getTeamLeads() {
        return service.getTeamLeads();
    }

    @GetMapping("/team-leads/{id}")
    public ResponseEntity<TeamLead> getDesignationById(@PathVariable int id) {
        try {
            return new ResponseEntity<>(service.getTeamLeadById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("team-leads")
    public TeamLead addTeamLead(@RequestBody TeamLead teamlead) {
        return service.addTeamLead(teamlead);
    }

    @DeleteMapping("/team-leads/{id}")
    public void deleteTeamLead(@PathVariable int id) {
        service.deleteTeamLead(id);
    }
}
