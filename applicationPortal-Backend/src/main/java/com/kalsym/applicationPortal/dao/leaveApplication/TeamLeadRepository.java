/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.kalsym.applicationPortal.dao.leaveApplication;

import com.kalsym.applicationPortal.model.leaveApplication.TeamLead;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author kalsym
 */
@Repository
public interface TeamLeadRepository extends JpaRepository<TeamLead, Integer>{
    
}
