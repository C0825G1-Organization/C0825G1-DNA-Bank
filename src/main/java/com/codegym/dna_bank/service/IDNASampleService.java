package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.DNASample;

import java.sql.SQLException;
import java.time.LocalDate;

public interface IDNASampleService {
    Integer insert(DNASample sample) throws Exception;
    DNASample findById(int sampleId) throws SQLException;
    DNASample findByUserId(int userId);
}
