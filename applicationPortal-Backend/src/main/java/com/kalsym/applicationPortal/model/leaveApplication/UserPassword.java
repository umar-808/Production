/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.model.leaveApplication;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author kalsym
 */
@Entity
@Table(name = "user_pass")
public class UserPassword {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int prefix_id;

    @Column(length = 20)
    private String prefix;

    @Column(length = 100)
    private String password;

    @OneToMany(mappedBy = "userPassword")
    @JsonManagedReference(value = "userPassword")
    private List<User> users;

    public UserPassword() {
    }

    public UserPassword(int prefix_id, String prefix, String password, List<User> users) {
        this.prefix_id = prefix_id;
        this.prefix = prefix;
        this.password = password;
        this.users = users;
    }

    public int getPrefix_id() {
        return prefix_id;
    }

    public void setPrefix_id(int prefix_id) {
        this.prefix_id = prefix_id;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
