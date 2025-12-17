package com.codegym.dna_bank.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class DNASample {
    private Integer sampleId;
    private Customer customer;
    private LocalDate testDate;
    private LocalDateTime createdDate;

    void onCreate() {
        createdDate = LocalDateTime.now();
    }

    public DNASample(Integer sampleId, Customer customer, LocalDate testDate, LocalDateTime createdDate) {
        this.sampleId = sampleId;
        this.customer = customer;
        this.testDate = testDate;
        this.createdDate = createdDate;
    }

    public Integer getSampleId() {
        return sampleId;
    }

    public void setSampleId(Integer sampleId) {
        this.sampleId = sampleId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public LocalDate getTestDate() {
        return testDate;
    }

    public void setTestDate(LocalDate testDate) {
        this.testDate = testDate;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }
}
