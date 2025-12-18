package com.codegym.dna_bank.service;

import com.codegym.dna_bank.entity.Account;
import com.codegym.dna_bank.repository.AccountRepository;

public class AccountService implements IAccountService{
    private final AccountRepository accountRepository = new AccountRepository();

    @Override
    public Account findByUsername(String username) {
        return accountRepository.findByUsername(username);
    }

    @Override
    public Account login(String username, String password) {
        return accountRepository.login(username, password);
    }
}
