package com.codegym.dna_bank.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class ComparisonResult {
    private Integer comparisonId;
    private Integer sample1Id;
    private Integer sample2Id;
    private Integer matchedLocus;
    private Float similarityPercent;
    private BigDecimal paternityIndex;
    private String relationship;
    private LocalDateTime comparedAt;

    public ComparisonResult() {
    }

    public ComparisonResult(Integer sample1Id, Integer sample2Id, Integer matchedLocus, Float similarityPercent, BigDecimal paternityIndex, String relationship) {
        this.sample1Id = sample1Id;
        this.sample2Id = sample2Id;
        this.matchedLocus = matchedLocus;
        this.similarityPercent = similarityPercent;
        this.paternityIndex = paternityIndex;
        this.relationship = relationship;
        this.comparedAt = LocalDateTime.now();
    }

    public ComparisonResult(Integer comparisonId, Integer sample1Id, Integer sample2Id, Integer matchedLocus, Float similarityPercent, BigDecimal paternityIndex, String relationship, LocalDateTime comparedAt) {
        this.comparisonId = comparisonId;
        this.sample1Id = sample1Id;
        this.sample2Id = sample2Id;
        this.matchedLocus = matchedLocus;
        this.similarityPercent = similarityPercent;
        this.paternityIndex = paternityIndex;
        this.relationship = relationship;
        this.comparedAt = comparedAt;
    }

    public Integer getComparisonId() {
        return comparisonId;
    }

    public void setComparisonId(Integer comparisonId) {
        this.comparisonId = comparisonId;
    }

    public Integer getSample1Id() {
        return sample1Id;
    }

    public void setSample1Id(Integer sample1Id) {
        this.sample1Id = sample1Id;
    }

    public Integer getSample2Id() {
        return sample2Id;
    }

    public void setSample2Id(Integer sample2Id) {
        this.sample2Id = sample2Id;
    }

    public Integer getMatchedLocus() {
        return matchedLocus;
    }

    public void setMatchedLocus(Integer matchedLocus) {
        this.matchedLocus = matchedLocus;
    }

    public Float getSimilarityPercent() {
        return similarityPercent;
    }

    public void setSimilarityPercent(Float similarityPercent) {
        this.similarityPercent = similarityPercent;
    }

    public BigDecimal getPaternityIndex() {
        return paternityIndex;
    }

    public void setPaternityIndex(BigDecimal paternityIndex) {
        this.paternityIndex = paternityIndex;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public LocalDateTime getComparedAt() {
        return comparedAt;
    }

    public void setComparedAt(LocalDateTime comparedAt) {
        this.comparedAt = comparedAt;
    }
}