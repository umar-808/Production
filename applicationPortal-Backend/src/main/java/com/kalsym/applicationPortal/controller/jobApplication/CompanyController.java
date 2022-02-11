/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.controller.jobApplication;

import com.kalsym.applicationPortal.model.jobApplication.Branch;
import com.kalsym.applicationPortal.model.jobApplication.Company;
import com.kalsym.applicationPortal.service.jobApplication.CompanyService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
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
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @GetMapping("/companies")
    public List<Company> getAll() {
        return companyService.getCompanies();
    }

    @GetMapping("/companies/{id}")
    public Company getCompanyById(@PathVariable Long id) {
        return companyService.getCompanyById(id);
    }

    @GetMapping("/companies/{companyId}/branches")
    public List<Branch> getBranches(@PathVariable Long companyId) {
        return companyService.getCompanyById(companyId).getBranches();
    }

    @PostMapping("/companies")
    public Company saveCompany(@RequestBody Company company) {
        return companyService.saveCompany(company);
    }

    @DeleteMapping("/companies/{id}")
    public void deleteCompany(@PathVariable Long id) {
        companyService.deleteCompanyById(id);
    }

}
