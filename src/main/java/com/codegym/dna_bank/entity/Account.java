package com.codegym.dna_bank.entity;

import java.time.LocalDateTime;

public class Account {
    private Integer accountId;
    private String username;
    private String password;
    private LocalDateTime createdAt;
    private LocalDateTime lastLogin;
    private String role; // "USER" or "ADMIN"

    public Account() {
    }

    public Account(String username, String password) {
        this.username = username;
        this.password = password;
        this.createdAt = LocalDateTime.now();
        this.role = "USER";
    }

    public Account(Integer accountId, String username, String password, LocalDateTime createdAt, LocalDateTime lastLogin, String role) {
        this.accountId = accountId;
        this.username = username;
        this.password = password;
        this.createdAt = createdAt;
        this.lastLogin = lastLogin;
        this.role = role;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(LocalDateTime lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}