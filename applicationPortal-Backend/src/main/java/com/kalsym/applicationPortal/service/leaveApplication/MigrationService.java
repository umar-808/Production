/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service.leaveApplication;

import com.kalsym.applicationPortal.dao.leaveApplication.MigrationRepository;
import com.kalsym.applicationPortal.model.leaveApplication.Migration;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class MigrationService {

    @Autowired
    private MigrationRepository repository;

    public Migration getMigrationById(int id) {
        return repository.findById(id).get();
    }

    public List<Migration> getMigrations() {
        return repository.findAll();
    }

    public Migration addMigration(Migration migration) {
        return repository.save(migration);
    }

    public void deleteMigration(int id) {
        repository.deleteById(id);
    }
}
