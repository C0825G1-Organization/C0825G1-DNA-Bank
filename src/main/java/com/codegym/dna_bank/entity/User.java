package com.codegym.dna_bank.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class User {
    private Integer userId;
    private Integer accountId;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private LocalDate dob;
    private String gender;
    private LocalDateTime createdAt;

    public User() {
    }

    public User(Integer accountId, String fullName, String email, String phone, String address, LocalDate dob, String gender) {
        this.accountId = accountId;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.createdAt = LocalDateTime.now();
    }

    public User(Integer userId, Integer accountId, String fullName, String email, String phone, String address, LocalDate dob, String gender, LocalDateTime createdAt) {
        this.userId = userId;
        this.accountId = accountId;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.createdAt = createdAt;
    }

    public User(String fullName, String address, LocalDate dob, String gender) {
        this.fullName = fullName;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDate getDob() {
        return dob;
    }

    /**
     * Get formatted date of birth for display (dd/MM/yyyy)
     */
    public String getFormattedDob() {
        if (dob == null) {
            return "";
        }
        return String.format("%02d/%02d/%d", 
            dob.getDayOfMonth(), 
            dob.getMonthValue(), 
            dob.getYear());
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}