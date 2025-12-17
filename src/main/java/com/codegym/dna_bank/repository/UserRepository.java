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
}
