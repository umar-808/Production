/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service.jobApplication;

import com.kalsym.applicationPortal.dao.jobApplication.CompanyRepository;
import com.kalsym.applicationPortal.model.jobApplication.Company;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class CompanyService {
    
    @Autowired
    private CompanyRepository repository;
    
    public Company addCompany(Company company) {
        return repository.save(company);
    }
    
    public List<Company> getCompanies() {
        return repository.findAll();
    }
    
    public Company getCompanyById(long id) {
        return repository.findById(id).get();
    }
    
    public void deleteCompanyById(long id) {
        repository.deleteById(id);
    }
    
}

