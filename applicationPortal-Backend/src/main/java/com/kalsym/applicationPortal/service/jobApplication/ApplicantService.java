/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service.jobApplication;

import com.kalsym.applicationPortal.dao.jobApplication.ApplicantRepository;
import com.kalsym.applicationPortal.model.jobApplication.Applicant;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class ApplicantService {
    
    @Autowired
    private ApplicantRepository repository;
    
    public Applicant addApplicant(Applicant applicant) {
        return repository.save(applicant);
    }
    
    public List<Applicant> getApplicants() {
        return repository.findAll();
    }
    
    public Applicant getApplicantById(long id) {
        return repository.findById(id).get();
    }
    
    public void deleteApplicantById(long id) {
        repository.deleteById(id);
    }
}
