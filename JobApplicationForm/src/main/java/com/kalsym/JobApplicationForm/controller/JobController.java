/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.JobApplicationForm.controller;

import com.kalsym.JobApplicationForm.model.Department;
import com.kalsym.JobApplicationForm.model.Job;
import com.kalsym.JobApplicationForm.model.Branch;
import com.kalsym.JobApplicationForm.service.JobService;
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
public class JobController {
    
    @Autowired
    private JobService jobService;
    
    @GetMapping("/jobs")
    public List<Job> getJobs() {
        return jobService.getJobs();
    }
    
    @GetMapping("/jobs/{id}")
    public ResponseEntity<Job> getJobById(@PathVariable Long id) {
        
        try {
            return new ResponseEntity<>(jobService.getJobById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    
    @PostMapping("/jobs")
    public Job add(@RequestBody Job job) {
        return jobService.saveJob(job);
    }
    
    @DeleteMapping("/jobs/{id}")
    public void deleteJob(@PathVariable Long id) {
        jobService.deleteJobById(id);
    }
}
