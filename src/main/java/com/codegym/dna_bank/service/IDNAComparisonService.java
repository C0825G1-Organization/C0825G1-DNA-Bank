package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.ComparisonResult;
import com.codegym.dna_bank.entity.DNALocusResult;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

public interface IDNAComparisonService {
    ComparisonResult compareDNA(int sample1Id, int sample2Id) throws SQLException;
    List<ComparisonResult> findRelatives(int userId);
}
