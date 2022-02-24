/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.controller.jobApplication;

import com.kalsym.applicationPortal.model.jobApplication.Applicant;
import com.kalsym.applicationPortal.model.jobApplication.File;
import com.kalsym.applicationPortal.service.jobApplication.ApplicantService;
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
public class ApplicantController {

    @Autowired
    private ApplicantService applicantService;

    @GetMapping("/applicants")
    public List<Applicant> getAll() {
        return applicantService.getApplicants();
    }

    @GetMapping("/applicants/{id}")
    public ResponseEntity<Applicant> getApplicantById(@PathVariable Long id) {
        try {
            return new ResponseEntity<>(applicantService.getApplicantById(id), HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/applicants/{id}/file")
    public File getFile(@PathVariable long id) {
        return applicantService.getApplicantById(id).getFile();
    }

    @PostMapping("/applicants")
    public void addApplicant(@RequestBody Applicant applicant) {
        applicantService.addApplicant(applicant);
    }

    @DeleteMapping("/applicants/{id}")
    public void deleteApplicant(@PathVariable Long id) {
        applicantService.deleteApplicantById(id);
    }
}
