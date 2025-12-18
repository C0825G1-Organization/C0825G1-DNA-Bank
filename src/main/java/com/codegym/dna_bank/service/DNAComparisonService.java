package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.ComparisonResult;
import com.codegym.dna_bank.repository.DNAComparisonRepository;

import java.sql.SQLException;
import java.util.List;

public class DNAComparisonService implements IDNAComparisonService{
    private final DNAComparisonRepository comparisonRepository = new DNAComparisonRepository();

    @Override
    public ComparisonResult compareDNA(int sample1Id, int sample2Id) throws SQLException {
        return comparisonRepository.compareDNA(sample1Id, sample2Id);
    }

    @Override
    public List<ComparisonResult> findRelatives(int userId) {
        return comparisonRepository.findRelatives(userId);
    }
}
