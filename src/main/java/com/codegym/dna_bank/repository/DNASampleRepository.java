package com.codegym.dna_bank.repository;

import com.codegym.dna_bank.entity.DNASample;

import java.sql.*;
import java.time.LocalDate;

public class DNASampleRepository {
    
    public Integer insert(DNASample sample) throws SQLException {
        String sql = "INSERT INTO dna_samples (user_id, gender, test_date, created_at) VALUES (?, ?, ?, NOW())";
        
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setInt(1, sample.getUserId());
            stmt.setString(2, sample.getGender());
            stmt.setObject(3, sample.getTestDate());
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
    
    public DNASample findById(int sampleId) throws SQLException {
        String sql = "SELECT * FROM dna_samples WHERE sample_id = ?";
        DNASample sample = null;
        
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, sampleId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                sample = new DNASample();
                sample.setSampleId(rs.getInt("sample_id"));
                sample.setUserId(rs.getInt("user_id"));
                sample.setGender(rs.getString("gender"));
                sample.setTestDate(rs.getObject("test_date", LocalDate.class));
                sample.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        
        return sample;
    }
}
