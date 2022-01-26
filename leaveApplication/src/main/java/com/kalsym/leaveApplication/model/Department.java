/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author kalsym
 */
@Entity
@Table(name = "department")
public class Department {

    @Id
    @SequenceGenerator(name = "MY_ENTITY_SEQ", sequenceName = "MY_ENTITY_SEQ", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "MY_ENTITY_SEQ")
    private int id;

    @Column(length = 30)
    private String name;

    @OneToMany(mappedBy = "department")
    @JsonManagedReference(value = "department")
    private List<Designation> designations;

    @OneToMany(mappedBy = "department")
    @JsonManagedReference(value = "leadDept")
    private List<TeamLead> teamLeads;

    @OneToMany(mappedBy = "department")
    @JsonManagedReference(value = "userDept")
    private List<User> users;

    public Department() {
    }

    public Department(int id, String name, List<Designation> designations, List<TeamLead> teamLeads, List<User> users) {
        this.id = id;
        this.name = name;
        this.designations = designations;
        this.teamLeads = teamLeads;
        this.users = users;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Designation> getDesignations() {
        return designations;
    }

    public void setDesignations(List<Designation> designations) {
        this.designations = designations;
    }

    public List<TeamLead> getTeamLeads() {
        return teamLeads;
    }

    public void setTeamLeads(List<TeamLead> teamLeads) {
        this.teamLeads = teamLeads;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
