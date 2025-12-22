package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService{
    List<User> findAll() throws SQLException;
    User findById(int id) throws SQLException;
    User findByName(String name) throws SQLException;
    boolean save(User t) throws SQLException;
    boolean update(User t) throws SQLException;
    User findByAccountId(int accountId);
}
