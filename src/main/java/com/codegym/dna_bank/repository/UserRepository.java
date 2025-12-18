package com.codegym.dna_bank.repository;

import com.codegym.dna_bank.entity.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {
    public List<User> findAll() throws SQLException {
        String sql = "select * from users";

        List<User> users = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                String name = resultSet.getString("full_name");
                String address = resultSet.getString("address");
                String dob = resultSet.getString("dob");
                LocalDate temp = LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                String gender = resultSet.getString("gender");
                users.add(new User(name, address, temp, gender));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    /**
     * Tìm user theo ID
     */
    public User findById(int userId) {
        String sql = "SELECT * FROM users WHERE user_id = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Tìm user theo account_id
     */
    public User findByAccountId(int accountId) {
        String sql = "SELECT * FROM users WHERE account_id = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Map ResultSet to User
     */
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("user_id"));
        user.setAccountId(rs.getInt("account_id"));
        user.setFullName(rs.getString("full_name"));
        user.setEmail(rs.getString("email"));
        user.setPhone(rs.getString("phone"));
        user.setAddress(rs.getString("address"));

        if (rs.getDate("dob") != null) {
            user.setDob(rs.getDate("dob").toLocalDate());
        }

        user.setGender(rs.getString("gender"));

        if (rs.getTimestamp("created_at") != null) {
            user.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        }

        return user;
    }
}
