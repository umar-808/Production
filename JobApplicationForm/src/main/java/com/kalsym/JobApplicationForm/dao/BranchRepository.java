package com.kalsym.JobApplicationForm.dao;

import com.kalsym.JobApplicationForm.model.Department;
import com.kalsym.JobApplicationForm.model.Branch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
/**
 *
 * @author kalsym
 */
@Repository
public interface BranchRepository extends JpaRepository<Branch, Long> {

    public Branch findByName(String name);
}
