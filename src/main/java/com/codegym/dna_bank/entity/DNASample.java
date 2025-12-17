package com.codegym.dna_bank.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class DNASample {
    private Integer sampleId;
    private Integer userId;
    private String gender;
    private LocalDate testDate;
    private LocalDateTime createdAt;

    public DNASample() {
    }

    public DNASample(Integer userId, String gender, LocalDate testDate) {
        this.userId = userId;
        this.gender = gender;
        this.testDate = testDate;
        this.createdAt = LocalDateTime.now();
    }

    public DNASample(Integer sampleId, Integer userId, String gender, LocalDate testDate, LocalDateTime createdAt) {
        this.sampleId = sampleId;
        this.userId = userId;
        this.gender = gender;
        this.testDate = testDate;
        this.createdAt = createdAt;
    }

    public Integer getSampleId() {
        return sampleId;
    }

    public void setSampleId(Integer sampleId) {
        this.sampleId = sampleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public LocalDate getTestDate() {
        return testDate;
    }

    public void setTestDate(LocalDate testDate) {
        this.testDate = testDate;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
