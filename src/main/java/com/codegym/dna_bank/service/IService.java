package com.codegym.dna_bank.service;

import java.sql.SQLException;
import java.util.List;

public interface IService <T>{
    List<T> findAll() throws SQLException;
    T findById(int id) throws SQLException;
    T findByNamer(String name) throws SQLException;
    boolean save(T t) throws SQLException;
    boolean update(T t) throws SQLException;
}