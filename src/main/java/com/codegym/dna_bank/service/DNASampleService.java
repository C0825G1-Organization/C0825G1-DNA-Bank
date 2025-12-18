package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.DNASample;
import com.codegym.dna_bank.repository.DNASampleRepository;

import java.sql.SQLException;

public class DNASampleService implements IDNASampleService{
    private final DNASampleRepository sampleRepository = new DNASampleRepository();

    @Override
    public Integer insert(DNASample sample) throws Exception {
        return sampleRepository.insert(sample);
    }

    @Override
    public DNASample findById(int sampleId) throws SQLException {
        return sampleRepository.findById(sampleId);
    }
}
