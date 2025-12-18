package com.codegym.dna_bank.repository;

import com.codegym.dna_bank.entity.DNALocusResult;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DNALocusResultRepository {
    
    public boolean insert(DNALocusResult result) throws SQLException {
        String sql = "INSERT INTO dna_locus_result (sample_id, locus_id, allele_1, allele_2) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, result.getSampleId());
            stmt.setInt(2, result.getLocusId());
            stmt.setString(3, result.getAllele1());
            stmt.setString(4, result.getAllele2());
            
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
    
    public boolean insertBatch(List<DNALocusResult> results) throws SQLException {
        String sql = "INSERT INTO dna_locus_result (sample_id, locus_id, allele_1, allele_2) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            conn.setAutoCommit(false);
            
            for (DNALocusResult result : results) {
                stmt.setInt(1, result.getSampleId());
                stmt.setInt(2, result.getLocusId());
                stmt.setString(3, result.getAllele1());
                stmt.setString(4, result.getAllele2());
                stmt.addBatch();
            }
            
            int[] affectedRows = stmt.executeBatch();
            conn.commit();
            
            return affectedRows.length == results.size();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
    
    public List<DNALocusResult> findBySampleId(int sampleId) throws SQLException {
        String sql = "SELECT * FROM dna_locus_result WHERE sample_id = ? ORDER BY locus_id";
        List<DNALocusResult> results = new ArrayList<>();
        
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, sampleId);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                DNALocusResult result = new DNALocusResult();
                result.setSampleId(rs.getInt("sample_id"));
                result.setLocusId(rs.getInt("locus_id"));
                result.setAllele1(rs.getString("allele_1"));
                result.setAllele2(rs.getString("allele_2"));
                results.add(result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        
        return results;
    }
}
