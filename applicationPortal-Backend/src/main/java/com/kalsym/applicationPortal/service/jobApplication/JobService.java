/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service.jobApplication;

import com.kalsym.applicationPortal.dao.jobApplication.JobRepository;
import com.kalsym.applicationPortal.model.jobApplication.Branch;
import com.kalsym.applicationPortal.model.jobApplication.Job;
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
    private JobRepository repository;

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

    public Branch getDeptId(long id) {
        return repository.findById(id).get().getDepartment().getBranch();
    }
}

