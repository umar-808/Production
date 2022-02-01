/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.model;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.kalsym.applicationPortal.model.jobApplication.Branch;
import com.kalsym.applicationPortal.model.jobApplication.Job;
import com.kalsym.applicationPortal.model.leaveApplication.Designation;
import com.kalsym.applicationPortal.model.leaveApplication.TeamLead;
import com.kalsym.applicationPortal.model.leaveApplication.User;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author kalsym
 */
@Entity
@Table(name = "department")
public class Department {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

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

    @ManyToOne
    @JoinColumn(name = "branch_id", nullable = false, referencedColumnName = "id")
    @JsonBackReference(value = "branch")
    private Branch branch;

    @OneToMany(mappedBy = "department")
    @JsonManagedReference(value = "department")
    private List<Job> jobs;

    public Department() {
    }

    public Department(long id, String name, List<Designation> designations, List<TeamLead> teamLeads, List<User> users, Branch branch, List<Job> jobs) {
        this.id = id;
        this.name = name;
        this.designations = designations;
        this.teamLeads = teamLeads;
        this.users = users;
        this.branch = branch;
        this.jobs = jobs;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
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

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }

    public List<Job> getJobs() {
        return jobs;
    }

    public void setJobs(List<Job> jobs) {
        this.jobs = jobs;
    }
}

