/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.JobApplicationForm.service;

import com.kalsym.JobApplicationForm.dao.JobRespository;
import com.kalsym.JobApplicationForm.model.Job;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class JobService {
    
    @Autowired
    private JobRespository repository;
    
    public Job saveJob(Job job) {
        return repository.save(job);
    }
    
    public List<Job> getJobs() {
        return repository.findAll();
    }
    
    public Job getJobById(long id) {
        return repository.findById(id).get();
    }
    
    public void deleteJobById(long id) {
        repository.deleteById(id);
    }
}
