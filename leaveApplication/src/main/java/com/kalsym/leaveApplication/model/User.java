/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author kalsym
 */
@Entity
@Table(name = "users")
public class User {

    @Id
    @SequenceGenerator(name = "MY_ENTITY_SEQ", sequenceName = "MY_ENTITY_SEQ", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "MY_ENTITY_SEQ")
    private int id;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private TeamLead teamLead;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private Leave leave;

    @Column(length = 765)
    private String name;

    @Column(length = 765)
    private String username;

    @Column(length = 765)
    private String password;

    @Column(name = "access_type")
    private int accessType;
    private int status;

    @Column(name = "remember_token", length = 300)
    private String rememberToken;

    @Column(name = "is_change_pass", columnDefinition = "TINYINT(1)")
    private boolean isChangePass;

    @Column(name = "created_at")
    private Timestamp createdAt;

    @Column(name = "updated_at")
    private Timestamp updatedAt;

    @Column(name = "wrong_pass_count", columnDefinition = "TINYINT(1)")
    private boolean wrongPassCount;

    @Column(name = "is_lock", columnDefinition = "TINYINT(1)")
    private boolean isLock;

    @Column(name = "lock_expired")
    private Timestamp lockExpired;

    @Column(length = 40)
    private String email;

    private int tlId;

    @Column(columnDefinition = "INT(2)")
    private int countryCode;

    @ManyToOne
    @JoinColumn(name = "prefix_id", nullable = false, referencedColumnName = "prefix_id")
    @JsonBackReference(value = "userPassword")
    private UserPassword userPassword;

    @ManyToOne
    @JoinColumn(name = "designationId", nullable = false, referencedColumnName = "id")
    @JsonBackReference(value = "designation")
    private Designation designation;

    @ManyToOne
    @JoinColumn(name = "departmentId", nullable = false, referencedColumnName = "id")
    @JsonBackReference(value = "userDept")
    private Department department;

    @OneToMany(mappedBy = "user")
    @JsonManagedReference(value = "user")
    private List<LeaveRequest> leaveRequests;

    public User() {
    }

    public User(int id, String name, String username, String password, int accessType, int status, String rememberToken, boolean isChangePass, Timestamp createdAt, Timestamp updatedAt, boolean wrongPassCount, boolean isLock, Timestamp lockExpired, String email, int tlId, int countryCode, UserPassword userPassword, Designation designation, Department department, List<LeaveRequest> leaveRequests) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.accessType = accessType;
        this.status = status;
        this.rememberToken = rememberToken;
        this.isChangePass = isChangePass;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.wrongPassCount = wrongPassCount;
        this.isLock = isLock;
        this.lockExpired = lockExpired;
        this.email = email;
        this.tlId = tlId;
        this.countryCode = countryCode;
        this.userPassword = userPassword;
        this.designation = designation;
        this.department = department;
        this.leaveRequests = leaveRequests;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAccessType() {
        return accessType;
    }

    public void setAccessType(int accessType) {
        this.accessType = accessType;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRememberToken() {
        return rememberToken;
    }

    public void setRememberToken(String rememberToken) {
        this.rememberToken = rememberToken;
    }

    public boolean isIsChangePass() {
        return isChangePass;
    }

    public void setIsChangePass(boolean isChangePass) {
        this.isChangePass = isChangePass;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public boolean isWrongPassCount() {
        return wrongPassCount;
    }

    public void setWrongPassCount(boolean wrongPassCount) {
        this.wrongPassCount = wrongPassCount;
    }

    public boolean isIsLock() {
        return isLock;
    }

    public void setIsLock(boolean isLock) {
        this.isLock = isLock;
    }

    public Timestamp getLockExpired() {
        return lockExpired;
    }

    public void setLockExpired(Timestamp lockExpired) {
        this.lockExpired = lockExpired;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTlId() {
        return tlId;
    }

    public void setTlId(int tlId) {
        this.tlId = tlId;
    }

    public int getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(int countryCode) {
        this.countryCode = countryCode;
    }

    public UserPassword getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(UserPassword userPassword) {
        this.userPassword = userPassword;
    }

    public Designation getDesignation() {
        return designation;
    }

    public void setDesignation(Designation designation) {
        this.designation = designation;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<LeaveRequest> getLeaveRequests() {
        return leaveRequests;
    }

    public void setLeaveRequests(List<LeaveRequest> leaveRequests) {
        this.leaveRequests = leaveRequests;
    }
}
