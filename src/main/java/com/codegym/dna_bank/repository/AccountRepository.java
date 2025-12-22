package com.codegym.dna_bank.repository;


import com.codegym.dna_bank.entity.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * Repository quản lý bảng account
 * Xử lý đăng nhập, quản lý tài khoản
 */
public class AccountRepository {

    /**
     * Tìm account theo username (Cực kỳ an toàn, không chết nếu thiếu cột)
     */
    public Account findByUsername(String username) {
        String sql = "SELECT * FROM `account` WHERE username = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Account account = new Account();
                    
                    // Core columns (Required)
                    account.setAccountId(rs.getInt("account_id"));
                    account.setUsername(rs.getString("username"));
                    account.setPassword(rs.getString("password"));

                    // Optional columns (May not exist yet)
                    try { account.setRole(rs.getString("role")); } catch (Exception e) {}
                    
                    try {
                        Timestamp createdAt = rs.getTimestamp("created_at");
                        if (createdAt != null) account.setCreatedAt(createdAt.toLocalDateTime());
                    } catch (Exception e) {}

                    try {
                        Timestamp lastLogin = rs.getTimestamp("last_login");
                        if (lastLogin != null) account.setLastLogin(lastLogin.toLocalDateTime());
                    } catch (Exception e) {}

                    return account;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error in findByUsername: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Kiểm tra đăng nhập
     */
    public Account login(String username, String password) {
        Account account = findByUsername(username);

        if (account != null) {
            String dbPassword = account.getPassword();
            if (dbPassword != null && dbPassword.equals(password)) {
                // Thử cập nhật last_login nhưng không quan trọng nếu thất bại
                try {
                    updateLastLogin(account.getAccountId());
                } catch (Exception e) {
                    System.err.println("Warning: Could not update last_login: " + e.getMessage());
                }
                return account;
            }
        }

        return null;
    }

    /**
     * Cập nhật thời gian đăng nhập cuối
     */
    public void updateLastLogin(int accountId) {
        String sql = "UPDATE `account` SET last_login = NOW() WHERE account_id = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ps.executeUpdate();
        } catch (SQLException e) {
            // Re-throw or ignore depending on criticality
            System.err.println("Error in updateLastLogin: " + e.getMessage());
        }
    }

    /**
     * Lấy tất cả account (cho admin)
     */
    public List<Account> findAll() throws SQLException {
        String sql = "SELECT * FROM `account` ORDER BY account_id ASC";
        List<Account> accounts = new ArrayList<>();

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Account account = new Account();
                account.setAccountId(rs.getInt("account_id"));
                account.setUsername(rs.getString("username"));
                
                try { account.setRole(rs.getString("role")); } catch (Exception e) {}
                
                try {
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    if (createdAt != null) account.setCreatedAt(createdAt.toLocalDateTime());
                } catch (Exception e) {}

                try {
                    Timestamp lastLogin = rs.getTimestamp("last_login");
                    if (lastLogin != null) account.setLastLogin(lastLogin.toLocalDateTime());
                } catch (Exception e) {}

                accounts.add(account);
            }
        }
        return accounts;
    }

    /**
     * Cập nhật role
     */
    public boolean updateRole(int accountId, String role) {
        String sql = "UPDATE `account` SET role = ? WHERE account_id = ?";
        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setString(1, role);
            ps.setInt(2, accountId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int insert(Account account) throws SQLException {
        String sql = "INSERT INTO `account` (username, password, role, created_at) VALUES (?, ?, ?, NOW())";
        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getRole());
            
            int rows = ps.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) return rs.getInt(1);
                }
            }
        }
        return -1;
    }

    /**
     * Xóa account
     */
    public boolean delete(int accountId) {
        String sql = "DELETE FROM `account` WHERE account_id = ?";
        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}