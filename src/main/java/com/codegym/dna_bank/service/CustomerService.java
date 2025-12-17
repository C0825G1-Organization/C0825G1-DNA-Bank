package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.Customer;
import com.codegym.dna_bank.repository.CustomerRepository;

import java.sql.SQLException;
import java.util.List;

public class CustomerService implements ICustomerService {
    private final CustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() throws SQLException {
        return customerRepository.findAll();
    }

    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public Customer findByNamer(String name) {
        return null;
    }

    @Override
    public boolean save(Customer customer) {
        return false;
    }

    @Override
    public boolean update(Customer customer) {
        return false;
    }
}
