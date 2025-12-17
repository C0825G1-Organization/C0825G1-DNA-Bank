package com.codegym.dna_bank.entity;

import java.io.Serializable;
import java.util.Objects;

public class DNALocusResult {
    private Integer sampleId;
    private Integer locusId;
    private String allele1;
    private String allele2;

    public DNALocusResult() {
    }

    public DNALocusResult(Integer sampleId, Integer locusId, String allele1, String allele2) {
        this.sampleId = sampleId;
        this.locusId = locusId;
        this.allele1 = allele1;
        this.allele2 = allele2;
    }

    public Integer getSampleId() {
        return sampleId;
    }

    public void setSampleId(Integer sampleId) {
        this.sampleId = sampleId;
    }

    public Integer getLocusId() {
        return locusId;
    }

    public void setLocusId(Integer locusId) {
        this.locusId = locusId;
    }

    public String getAllele1() {
        return allele1;
    }

    public void setAllele1(String allele1) {
        this.allele1 = allele1;
    }

    public String getAllele2() {
        return allele2;
    }

    public void setAllele2(String allele2) {
        this.allele2 = allele2;
    }

    // Composite Key class
    public static class DNALocusResultId implements Serializable {
        private Integer sampleId;
        private Integer locusId;

        public DNALocusResultId() {
        }

        public DNALocusResultId(Integer sampleId, Integer locusId) {
            this.sampleId = sampleId;
            this.locusId = locusId;
        }

        public Integer getSampleId() {
            return sampleId;
        }

        public void setSampleId(Integer sampleId) {
            this.sampleId = sampleId;
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
            if (!(o instanceof DNALocusResultId)) return false;
            DNALocusResultId that = (DNALocusResultId) o;
            return Objects.equals(sampleId, that.sampleId) && Objects.equals(locusId, that.locusId);
        }

        @Override
        public int hashCode() {
            return Objects.hash(sampleId, locusId);
        }
    }
}