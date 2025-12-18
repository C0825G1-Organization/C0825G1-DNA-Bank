package com.codegym.dna_bank.repository;

import com.codegym.dna_bank.entity.ComparisonResult;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ComparisonResultRepository {

    public int save(ComparisonResult result) {
        String sql = "INSERT INTO comparison_results " +
                "(sample_1, sample_2, matched_locus, similarity_percent, paternity_index, relationship) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, result.getSample1Id());
            ps.setInt(2, result.getSample2Id());
            ps.setInt(3, result.getMatchedLocus());
            ps.setFloat(4, result.getSimilarityPercent());
            ps.setBigDecimal(5, result.getPaternityIndex());
            ps.setString(6, result.getRelationship());

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }

    public boolean isCompared(int sample1Id, int sample2Id) {
        String sql = "SELECT COUNT(*) FROM comparison_results " +
                "WHERE (sample_1 = ? AND sample_2 = ?) OR (sample_1 = ? AND sample_2 = ?)";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, sample1Id);
            ps.setInt(2, sample2Id);
            ps.setInt(3, sample2Id);
            ps.setInt(4, sample1Id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public ComparisonResult findById(int comparisonId) {
        String sql = "SELECT * FROM comparison_results WHERE comparison_id = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, comparisonId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToComparison(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    private ComparisonResult mapResultSetToComparison(ResultSet rs) throws SQLException {
        ComparisonResult result = new ComparisonResult();
        result.setComparisonId(rs.getInt("comparison_id"));
        result.setSample1Id(rs.getInt("sample_1"));
        result.setSample2Id(rs.getInt("sample_2"));
        result.setMatchedLocus(rs.getInt("matched_locus"));
        result.setSimilarityPercent(rs.getFloat("similarity_percent"));
        result.setPaternityIndex(rs.getBigDecimal("paternity_index"));
        result.setRelationship(rs.getString("relationship"));
        result.setComparedAt(rs.getTimestamp("compared_at").toLocalDateTime());
        return result;
    }
}