/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.model.leaveApplication;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author kalsym
 */
@Entity
@Table(name = "leaves")
public class Leave implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long empId;

    @OneToOne(cascade = CascadeType.ALL, optional = false)
    @JoinColumn(name = "empId")
    @MapsId
    private User user;

    @Column(columnDefinition = "INT(2)")
    private int total;

    @Column(columnDefinition = "INT(2) DEFAULT 0")
    private int sickAvailed;

    @Column(columnDefinition = "INT(2) DEFAULT 0")
    private int otherAvailed;

    @Column(columnDefinition = "INT(2) DEFAULT 0")
    private int annualAvailed;

    @Column(columnDefinition = "INT(2) DEFAULT 0")
    private int annualLeft;

    public Leave() {
    }

    public Leave(long empId, User user, int total, int sickAvailed, int otherAvailed, int annualAvailed, int annualLeft) {
        this.empId = empId;
        this.user = user;
        this.total = total;
        this.sickAvailed = sickAvailed;
        this.otherAvailed = otherAvailed;
        this.annualAvailed = annualAvailed;
        this.annualLeft = annualLeft;
    }

    public long getEmpId() {
        return empId;
    }

    public void setEmpId(long empId) {
        this.empId = empId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getSickAvailed() {
        return sickAvailed;
    }

    public void setSickAvailed(int sickAvailed) {
        this.sickAvailed = sickAvailed;
    }

    public int getOtherAvailed() {
        return otherAvailed;
    }

    public void setOtherAvailed(int otherAvailed) {
        this.otherAvailed = otherAvailed;
    }

    public int getAnnualAvailed() {
        return annualAvailed;
    }

    public void setAnnualAvailed(int annualAvailed) {
        this.annualAvailed = annualAvailed;
    }

    public int getAnnualLeft() {
        return annualLeft;
    }

    public void setAnnualLeft(int annualLeft) {
        this.annualLeft = annualLeft;
    }
}
