package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.Account;

public interface IAccountService {
    Account findByUsername(String username);
    Account login(String username, String password);
}
