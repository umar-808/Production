/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.JobApplicationForm.service;

import com.kalsym.JobApplicationForm.model.Branch;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kalsym.JobApplicationForm.dao.BranchRepository;

/**
 *
 * @author kalsym
 */
@Service
public class BranchService {
    
    @Autowired
    private BranchRepository repository;
    
    public Branch saveBranch(Branch branch) {
        return repository.save(branch);
    }
    
    public List<Branch> getBranches() {
        return repository.findAll();
    }
    
    public Branch getBranchById(long id) {
        return repository.findById(id).get();
    }
    
    public Branch getBranchByName(String name) {
        return repository.findByName(name);
    }
    
    public void deleteBranchById(long id) {
        repository.deleteById(id);
    }
}
