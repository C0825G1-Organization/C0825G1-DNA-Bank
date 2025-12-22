package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.DNALocusResult;

import java.util.List;

public interface IDNALocusResultService {
    boolean insert(DNALocusResult result) throws Exception;
    boolean insertBatch(List<DNALocusResult> results) throws Exception;
    List<DNALocusResult> findBySampleId(int sampleId) throws Exception;
}
