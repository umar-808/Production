/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service;

import com.kalsym.applicationPortal.service.leaveApplication.UserService;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author kalsym
 */
@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService service;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        com.kalsym.applicationPortal.model.leaveApplication.User user = service.getUserByUsername(username);
        try {
            if (user != null) {
                return new User(user.getUsername(), user.getPassword(), new ArrayList<>());
            }
        } catch (UsernameNotFoundException e) {
            throw new UsernameNotFoundException("User not found");
        }
        return null;
    }

}
