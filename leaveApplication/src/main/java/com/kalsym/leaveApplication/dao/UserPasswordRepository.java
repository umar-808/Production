/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.kalsym.leaveApplication.dao;

import com.kalsym.leaveApplication.model.UserPassword;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author kalsym
 */
@Repository
public interface UserPasswordRepository extends JpaRepository<UserPassword, Integer>{
    
}
