/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.controller.leaveApplication;

import com.kalsym.applicationPortal.model.leaveApplication.Migration;
import com.kalsym.applicationPortal.service.leaveApplication.MigrationService;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author kalsym
 */
@RestController
@CrossOrigin("*")
public class MigrationController {

    @Autowired
    private MigrationService service;

    @GetMapping("/migrations")
    public List<Migration> getMigrations() {
        return service.getMigrations();
    }

    @GetMapping("/migrations/{id}")
    public ResponseEntity<Migration> getMigrationById(@PathVariable long id) {
        try {
            return new ResponseEntity<>(service.getMigrationById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/migrations")
    public Migration addMigration(@RequestBody Migration migration) {
        return service.addMigration(migration);
    }

    @DeleteMapping("/migrations/{id}")
    public void deleteMigration(@PathVariable long id) {
        service.deleteMigration(id);
    }
}
