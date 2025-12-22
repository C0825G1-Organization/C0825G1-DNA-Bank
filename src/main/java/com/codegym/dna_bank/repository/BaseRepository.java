package com.codegym.dna_bank.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {

    private static String jdbcURL = "jdbc:mysql://localhost:3306/dna_system?useSSL=false&serverTimezone=UTC";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "sinh6802";
    
    private BaseRepository() {
        // Private constructor to prevent instantiation
    }

    /**
     * Get a NEW database connection.
     * This method creates a fresh connection each time it's called.
     * Callers are responsible for closing the connection.
     */
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
    }
}