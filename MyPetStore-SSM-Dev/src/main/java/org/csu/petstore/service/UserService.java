package org.csu.petstore.service;

import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.Journal;
import org.csu.petstore.entity.ResetPassword;
import org.csu.petstore.entity.Signon;
import org.csu.petstore.vo.AccountVO;

import java.util.List;

public interface UserService {
    public Account getAccountByUsernameAndPssword(String username,String password);
    public AccountVO getAccountVOByUsername(String username);
    public Signon getSignonByUsername(String username);
    public void insertAccount(AccountVO accountVO);
    public void updateJournal(String userId, String description, String date, String color);
    public List<Journal> getAllJournals(String username);
    public void updateAccount(AccountVO accountVO);
    public void addResetPassword(ResetPassword resetPassword);
}
