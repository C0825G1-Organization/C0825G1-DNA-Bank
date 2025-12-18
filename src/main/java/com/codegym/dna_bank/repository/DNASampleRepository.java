package com.codegym.dna_bank.repository;

import com.codegym.dna_bank.entity.DNASample;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Repository quản lý bảng dna_samples
 */
public class DNASampleRepository {

    /**
     * Lấy DNA sample của 1 user
     * @param userId ID của user
     * @return DNASample hoặc null
     */
    public DNASample findByUserId(int userId) {
        String sql = "SELECT * FROM dna_samples WHERE user_id = ? LIMIT 1";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToSample(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Lấy tất cả DNA samples (trừ user hiện tại)
     * @param excludeUserId ID user cần loại trừ
     * @return List DNASample
     */
    public List<DNASample> findAllExcept(int excludeUserId) {
        List<DNASample> samples = new ArrayList<>();
        String sql = "SELECT * FROM dna_samples WHERE user_id != ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, excludeUserId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                samples.add(mapResultSetToSample(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return samples;
    }

    /**
     * Tìm sample theo ID
     * @param sampleId ID của sample
     * @return DNASample hoặc null
     */
    public DNASample findById(int sampleId) {
        String sql = "SELECT * FROM dna_samples WHERE sample_id = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, sampleId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToSample(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Map ResultSet to DNASample
     */
    private DNASample mapResultSetToSample(ResultSet rs) throws SQLException {
        DNASample sample = new DNASample();
        sample.setSampleId(rs.getInt("sample_id"));
        sample.setUserId(rs.getInt("user_id"));
        sample.setGender(rs.getString("gender"));

        if (rs.getDate("test_date") != null) {
            sample.setTestDate(rs.getDate("test_date").toLocalDate());
        }

        if (rs.getTimestamp("created_at") != null) {
            sample.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        }

        return sample;
    }
}