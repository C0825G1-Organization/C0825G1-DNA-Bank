package com.codegym.dna_bank.repository;

import com.codegym.dna_bank.entity.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository {
    public List<Customer> findAll() throws SQLException {
        String sql = "select * from users";

        List<Customer> customers = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                String name = resultSet.getString("full_name");
                String address = resultSet.getString("address");
                String dob = resultSet.getString("dob");
                LocalDate temp = LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                String gender = resultSet.getString("gender");
                customers.add(new Customer(name, address, temp, gender));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
}
