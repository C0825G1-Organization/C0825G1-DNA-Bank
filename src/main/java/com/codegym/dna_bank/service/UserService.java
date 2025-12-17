package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.User;
import com.codegym.dna_bank.repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private final UserRepository userRepository = new UserRepository();

    @Override
    public List<User> findAll() throws SQLException {
        return userRepository.findAll();
    }

    @Override
    public User findById(int id) throws SQLException {
        return null;
    }

    @Override
    public User findByNamer(String name) throws SQLException {
        return null;
    }

    @Override
    public boolean save(User user) throws SQLException {
        return false;
    }

    @Override
    public boolean update(User user) throws SQLException {
        return false;
    }
}
