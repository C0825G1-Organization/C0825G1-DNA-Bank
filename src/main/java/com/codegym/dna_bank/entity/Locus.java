package com.codegym.dna_bank.entity;

public class Locus {
    private Integer locusId;
    private String locusName;

    public Locus() {
    }

    public Locus(String locusName) {
        this.locusName = locusName;
    }

    public Locus(Integer locusId, String locusName) {
        this.locusId = locusId;
        this.locusName = locusName;
    }

    public Integer getLocusId() {
        return locusId;
    }

    public void setLocusId(Integer locusId) {
        this.locusId = locusId;
    }

    public String getLocusName() {
        return locusName;
    }

    public void setLocusName(String locusName) {
        this.locusName = locusName;
    }
}