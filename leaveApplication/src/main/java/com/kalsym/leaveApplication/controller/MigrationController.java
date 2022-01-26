/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.controller;

import com.kalsym.leaveApplication.model.Migration;
import com.kalsym.leaveApplication.service.MigrationService;
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
public class MigrationController {

    @Autowired
    private MigrationService service;

    @GetMapping("/migrations")
    public List<Migration> getMigrations() {
        return service.getMigrations();
    }

    @PostMapping("/migrations")
    public Migration addMigration(@RequestBody Migration migration) {
        return service.addMigration(migration);
    }
}
