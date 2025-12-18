package com.codegym.dna_bank.repository;


import com.codegym.dna_bank.entity.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 * Repository quản lý bảng account
 * Xử lý đăng nhập, đăng ký
 */
public class AccountRepository {

    /**
     * Tìm account theo username
     * @param username Tên đăng nhập
     * @return Account hoặc null
     */
    public Account findByUsername(String username) {
        String sql = "SELECT * FROM account WHERE username = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccountId(rs.getInt("account_id"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));

                Timestamp createdAt = rs.getTimestamp("created_at");
                if (createdAt != null) {
                    account.setCreatedAt(createdAt.toLocalDateTime());
                }

                return account;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Kiểm tra đăng nhập (không mã hóa password - demo only)
     * @param username Tên đăng nhập
     * @param password Mật khẩu
     * @return Account nếu đúng, null nếu sai
     */
    public Account login(String username, String password) {
        Account account = findByUsername(username);

        if (account != null) {
            // So sánh password trực tiếp (không hash - để test dễ)
            // Production nên dùng BCrypt.checkpw()
            if (account.getPassword().equals(password)) {
                // Cập nhật last_login
                updateLastLogin(account.getAccountId());
                return account;
            }
        }

        return null;
    }

    /**
     * Cập nhật thời gian đăng nhập cuối
     * @param accountId ID của account
     */
    private void updateLastLogin(int accountId) {
        String sql = "UPDATE account SET last_login = NOW() WHERE account_id = ?";

        try (PreparedStatement ps = BaseRepository.getConnection().prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}