/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.leaveApplication.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 * @author kalsym
 */
@Entity
@Table(name = "leave_requests")
public class LeaveRequest {

    @Id
    @SequenceGenerator(name = "MY_ENTITY_SEQ", sequenceName = "MY_ENTITY_SEQ", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "MY_ENTITY_SEQ")
    private int id;

    private Date created;

    @Column(length = 50)
    private String name;

    private Date leaveDate;

    @Column(name = "return_date")
    private Date returnDate;

    @Column(columnDefinition = "INT(2)")
    private int leaves;

    @Column(length = 500)
    private String reason;

    @Column(columnDefinition = "TINYINT(1)")
    private int status;

    @Column(length = 500)
    private String comment;

    @Column(length = 100)
    private String type;

    @Column(length = 200)
    private String adminComment;

    @Column(name = "updated_id")
    private Date updatedAt;

    @Column(columnDefinition = "INT(2)")
    private int lineManagerId;

    @Column(length = 100)
    private String attachment;

    @Column(columnDefinition = "INT(4)")
    private int countryCode;

    @Column(name = "time_period", length = 10)
    private String timePeriod;

    @ManyToOne
    @JoinColumn(name = "empId", nullable = false, referencedColumnName = "id")
    @JsonBackReference(value = "user")
    private User user;

    public LeaveRequest() {
    }

    public LeaveRequest(int id, Date created, String name, Date leaveDate, Date returnDate, int leaves, String reason, int status, String comment, String type, String adminComment, Date updatedAt, int lineManagerId, String attachment, int countryCode, String timePeriod, User user) {
        this.id = id;
        this.created = created;
        this.name = name;
        this.leaveDate = leaveDate;
        this.returnDate = returnDate;
        this.leaves = leaves;
        this.reason = reason;
        this.status = status;
        this.comment = comment;
        this.type = type;
        this.adminComment = adminComment;
        this.updatedAt = updatedAt;
        this.lineManagerId = lineManagerId;
        this.attachment = attachment;
        this.countryCode = countryCode;
        this.timePeriod = timePeriod;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getLeaveDate() {
        return leaveDate;
    }

    public void setLeaveDate(Date leaveDate) {
        this.leaveDate = leaveDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public int getLeaves() {
        return leaves;
    }

    public void setLeaves(int leaves) {
        this.leaves = leaves;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAdminComment() {
        return adminComment;
    }

    public void setAdminComment(String adminComment) {
        this.adminComment = adminComment;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getLineManagerId() {
        return lineManagerId;
    }

    public void setLineManagerId(int lineManagerId) {
        this.lineManagerId = lineManagerId;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public int getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(int countryCode) {
        this.countryCode = countryCode;
    }

    public String getTimePeriod() {
        return timePeriod;
    }

    public void setTimePeriod(String timePeriod) {
        this.timePeriod = timePeriod;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
