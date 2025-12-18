package com.codegym.dna_bank.repository;

import com.codegym.dna_bank.entity.DNALocusResult;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DNALocusResultRepository {

    public List<DNALocusResult> findBySampleId(int sampleId) {
        List<DNALocusResult> results = new ArrayList<>();
        String sql = "SELECT sample_id, locus_id, allele_1, allele_2 " +
                "FROM dna_locus_results WHERE sample_id = ? ORDER BY locus_id";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, sampleId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DNALocusResult result = new DNALocusResult();
                result.setSampleId(rs.getInt("sample_id"));
                result.setLocusId(rs.getInt("locus_id"));
                result.setAllele1(new String(rs.getBytes("allele_1")));
                result.setAllele2(new String(rs.getBytes("allele_2")));
                results.add(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return results;
    }

    public DNALocusResult findByLocusId(int sampleId, int locusId) {
        String sql = "SELECT sample_id, locus_id, allele_1, allele_2 " +
                "FROM dna_locus_results WHERE sample_id = ? AND locus_id = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, sampleId);
            ps.setInt(2, locusId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                DNALocusResult result = new DNALocusResult();
                result.setSampleId(rs.getInt("sample_id"));
                result.setLocusId(rs.getInt("locus_id"));
                result.setAllele1(new String(rs.getBytes("allele_1")));
                result.setAllele2(new String(rs.getBytes("allele_2")));
                return result;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}