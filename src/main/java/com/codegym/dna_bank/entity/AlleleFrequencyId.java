package com.codegym.dna_bank.entity;

import java.io.Serializable;
import java.util.Objects;

public class AlleleFrequencyId implements Serializable {
    private Integer locusId;
    private String allele;

    public AlleleFrequencyId() {
    }

    public AlleleFrequencyId(Integer locusId, String allele) {
        this.locusId = locusId;
        this.allele = allele;
    }

    public Integer getLocusId() {
        return locusId;
    }

    public void setLocusId(Integer locusId) {
        this.locusId = locusId;
    }

    public String getAllele() {
        return allele;
    }

    public void setAllele(String allele) {
        this.allele = allele;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof AlleleFrequencyId)) return false;
        AlleleFrequencyId that = (AlleleFrequencyId) o;
        return Objects.equals(locusId, that.locusId) && Objects.equals(allele, that.allele);
    }

    @Override
    public int hashCode() {
        return Objects.hash(locusId, allele);
    }
}