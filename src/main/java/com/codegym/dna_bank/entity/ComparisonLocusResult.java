package com.codegym.dna_bank.entity;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Objects;

public class ComparisonLocusResult {
    private Integer comparisonId;
    private Integer locusId;
    private BigDecimal piValue;

    public ComparisonLocusResult() {
    }

    public ComparisonLocusResult(Integer comparisonId, Integer locusId, BigDecimal piValue) {
        this.comparisonId = comparisonId;
        this.locusId = locusId;
        this.piValue = piValue;
    }

    public Integer getComparisonId() {
        return comparisonId;
    }

    public void setComparisonId(Integer comparisonId) {
        this.comparisonId = comparisonId;
    }

    public Integer getLocusId() {
        return locusId;
    }

    public void setLocusId(Integer locusId) {
        this.locusId = locusId;
    }

    public BigDecimal getPiValue() {
        return piValue;
    }

    public void setPiValue(BigDecimal piValue) {
        this.piValue = piValue;
    }

    // Composite Key class
    public static class ComparisonLocusResultId implements Serializable {
        private Integer comparisonId;
        private Integer locusId;

        public ComparisonLocusResultId() {
        }

        public ComparisonLocusResultId(Integer comparisonId, Integer locusId) {
            this.comparisonId = comparisonId;
            this.locusId = locusId;
        }

        public Integer getComparisonId() {
            return comparisonId;
        }

        public void setComparisonId(Integer comparisonId) {
            this.comparisonId = comparisonId;
        }

        public Integer getLocusId() {
            return locusId;
        }

        public void setLocusId(Integer locusId) {
            this.locusId = locusId;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof ComparisonLocusResultId)) return false;
            ComparisonLocusResultId that = (ComparisonLocusResultId) o;
            return Objects.equals(comparisonId, that.comparisonId) && Objects.equals(locusId, that.locusId);
        }

        @Override
        public int hashCode() {
            return Objects.hash(comparisonId, locusId);
        }
    }
}