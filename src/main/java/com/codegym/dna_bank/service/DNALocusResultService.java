package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.DNALocusResult;
import com.codegym.dna_bank.repository.DNALocusResultRepository;

import java.util.List;

public class DNALocusResultService implements IDNALocusResultService{
    private final DNALocusResultRepository resultRepository = new DNALocusResultRepository();

    @Override
    public boolean insert(DNALocusResult result) throws Exception {
        return resultRepository.insert(result);
    }

    @Override
    public boolean insertBatch(List<DNALocusResult> results) throws Exception {
        return resultRepository.insertBatch(results);
    }

    @Override
    public List<DNALocusResult> findBySampleId(int sampleId) throws Exception {
        return resultRepository.findBySampleId(sampleId);
    }
}
