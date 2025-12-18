package com.codegym.dna_bank.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class AlleleFrequencyRepository {

    public double getFrequency(int locusId, String allele) {
        String sql = "SELECT frequency FROM allele_frequency WHERE locus_id = ? AND allele = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, locusId);
            ps.setBytes(2, allele.getBytes());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getDouble("frequency");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0.0001;
    }

    public Map<String, Double> getAllFrequenciesForLocus(int locusId) {
        Map<String, Double> frequencies = new HashMap<>();
        String sql = "SELECT allele, frequency FROM allele_frequency WHERE locus_id = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, locusId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String allele = new String(rs.getBytes("allele"));
                double frequency = rs.getDouble("frequency");
                frequencies.put(allele, frequency);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return frequencies;
    }
}