package com.codegym.dna_bank.entity;

import java.time.LocalDate;

public class Customer {
    private Integer customerId;
    private String customerName;
    private LocalDate dob;
    private String email;
    private String phoneNumber;
    private String address;
    private String gender;

    public Customer(){

    }

    public Customer (String customerName, String address, LocalDate dob, String gender){
        this.customerName = customerName;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
    }

    public Customer(Integer customerId, String customerName, LocalDate dob, String email, String phoneNumber, String address, String gender) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.dob = dob;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.gender = gender;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}

