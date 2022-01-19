/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.kalsym.JobApplicationForm.dao;

import com.kalsym.JobApplicationForm.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author kalsym
 */
@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {

    public Department findByName(String name);

}
