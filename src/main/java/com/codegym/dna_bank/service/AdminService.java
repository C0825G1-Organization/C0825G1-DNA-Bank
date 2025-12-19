package com.codegym.dna_bank.service;

import com.codegym.dna_bank.repository.BaseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class AdminService {

    /**
     * Lấy thống kê tổng quan hệ thống
     */
    public Map<String, Integer> getSystemStats() {
        Map<String, Integer> stats = new HashMap<>();
        stats.put("totalUsers", getCount("users"));
        stats.put("totalAccounts", getCount("account"));
        stats.put("totalSamples", get6Count("dna_samples"));
        stats.put("totalComparisons", getCount("comparison_results"));
        return stats;
    }

    private int get6Count(String table) {
        // Implementation for DNA samples
        return getCount(table);
    }

    private int getCount(String table) {
        String sql = "SELECT COUNT(*) FROM " + table;
        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
