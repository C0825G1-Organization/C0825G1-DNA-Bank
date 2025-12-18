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
        String sql = "SELECT * FROM users";

        List<User> users = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                int userId = resultSet.getInt("user_id");
                int accountId = resultSet.getInt("account_id");
                String fullName = resultSet.getString("full_name");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String dobString = resultSet.getString("dob");
                LocalDate dob = LocalDate.parse(dobString, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                String gender = resultSet.getString("gender");
                
                users.add(new User(userId, accountId, fullName, email, phone, address, dob, gender, null));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public User findById(int id) throws SQLException {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        User user = null;
        
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            if (resultSet.next()) {
                int userId = resultSet.getInt("user_id");
                int accountId = resultSet.getInt("account_id");
                String fullName = resultSet.getString("full_name");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String dobString = resultSet.getString("dob");
                LocalDate dob = LocalDate.parse(dobString, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                String gender = resultSet.getString("gender");
                
                user = new User(userId, accountId, fullName, email, phone, address, dob, gender, null);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }

    public boolean insert(User user) throws SQLException {
        String sql = "INSERT INTO users (account_id, full_name, email, phone, address, dob, gender, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";
        
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(sql);
            preparedStatement.setObject(1, user.getAccountId());
            preparedStatement.setString(2, user.getFullName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.setString(5, user.getAddress());
            preparedStatement.setObject(6, user.getDob());
            preparedStatement.setString(7, user.getGender());
            
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
}
