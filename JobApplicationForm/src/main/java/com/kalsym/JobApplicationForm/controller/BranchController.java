/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.JobApplicationForm.controller;

import com.kalsym.JobApplicationForm.model.Branch;
import com.kalsym.JobApplicationForm.service.BranchService;
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
public class BranchController {
    
    @Autowired
    private BranchService branchService;
    
    @GetMapping("/branches")
    public List<Branch> getAll() {
        return branchService.getBranches();
    }
    
    @GetMapping("branches/name/{name}")
    public ResponseEntity<Branch> getBranchByName(@PathVariable String name) {
        try {
            return new ResponseEntity<>(branchService.getBranchByName(name), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    
    @GetMapping("branches/{id}")
    public ResponseEntity<Branch> getBranchById(@PathVariable Long id) {
        try {
            return new ResponseEntity<>(branchService.getBranchById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    
    @PostMapping("/branches")
    public Branch saveBranch(@RequestBody Branch branch) {
        return branchService.saveBranch(branch);
    }
    
    @DeleteMapping("/branches/{id}")
    public void deleteBranch(@PathVariable Long id) {
        branchService.deleteBranchById(id);
    }
}
