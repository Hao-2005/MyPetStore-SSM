package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jakarta.annotation.PostConstruct;
import org.csu.petstore.entity.*;
import org.csu.petstore.persistence.*;
import org.csu.petstore.service.UserService;
import org.csu.petstore.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private AccountMapper accountMapper;
    @Autowired
    private SignonMapper signonMapper;
    @Autowired
    private BannerDataMapper bannerDataMapper;
    @Autowired
    private ProfileMapper profileMapper;
    @Autowired
    private JournalMapper journalMapper;
    @Autowired
    private ResetPasswordMapper resetPasswordMapper;
    @Autowired
    private ViewProductMapper viewProductMapper;
    @Autowired
    private ProductJournalMapper productJournalMapper;

    @Override
    public Account getAccountByUsernameAndPssword(String username, String password) {
        Signon signon = signonMapper.selectById(username);
        if(signon.getPassword().equals(password)){
            Account account = accountMapper.selectById(username);
            return account;
        }else{
            return null;
        }
    }

    @Override
    public void insertAccount(AccountVO accountVO) {
        accountMapper.insert(accountVO.getAccount());
        signonMapper.insert(accountVO.getSignon());
        profileMapper.insert(accountVO.getProfile());
    }

    @Override
    public Signon getSignonByUsername(String username) {
        Signon signon = signonMapper.selectById(username);
        return signon;
    }

    @Override
    public AccountVO getAccountVOByUsername(String username) {
        Account account = accountMapper.selectById(username);
        Signon signon = signonMapper.selectById(username);
        BannerData bannerData = bannerDataMapper.selectById(username);
        Profile profile = profileMapper.selectById(username);
        QueryWrapper<Journal> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userId", username);
        List<Journal> journals = journalMapper.selectList(queryWrapper);
        AccountVO accountVO = new AccountVO();
        accountVO.setAccount(account);
        accountVO.setBannerDataAndProfile(bannerData, profile);
        accountVO.setJournals(journals);
        accountVO.setPassword(signon.getPassword());
        return accountVO;
    }

    @Override
    public void updateJournal(String userId, String description, String date, String color) {
        Journal journal = new Journal();
        journal.setUsername(userId);
        journal.setDescription(description);
        journal.setDate(date);
        journal.setColor(color);
        journalMapper.insert(journal);
    }

    @Override
    public List<Journal> getAllJournals(String username) {
        QueryWrapper<Journal> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userId", username);
        List<Journal> journals = journalMapper.selectList(queryWrapper);
        return journals;
    }

    @Override
    public void updateAccount(AccountVO accountVO) {
        accountMapper.updateById(accountVO.getAccount());
        profileMapper.updateById(accountVO.getProfile());
        if(accountVO.getPassword() != null && accountVO.getPassword().length() > 0)
            signonMapper.updateById(accountVO.getSignon());
    }

    @Override
    public void addResetPassword(ResetPassword resetPassword) {
        resetPasswordMapper.insert(resetPassword);
    }

    @Override
    public void addViewProduct(String productId, String username)
    {
        System.out.println(productId);
        System.out.println(username);
        //更新商品浏览总次数
        ViewProduct viewProduct = viewProductMapper.selectById(productId);

        if (viewProduct != null)
        {
            //如果商品存在，viewCount+1
            int currentCount = viewProduct.getViewCount();
            viewProduct.setViewCount(currentCount + 1);
            viewProductMapper.updateById(viewProduct);
        }
        else
        {
            //如果不存在，插入新数据
            viewProduct = new ViewProduct();
            viewProduct.setProductId(productId);
            viewProduct.setViewCount(1);  //第一次访问
            viewProductMapper.insert(viewProduct);
        }

        //记录用户浏览行为
        if(!Objects.equals(username, "") && username != null)
        {
            ProductJournal productJournal = new ProductJournal();
            productJournal.setUserId(username);
            productJournal.setProductId(productId);
            productJournalMapper.insert(productJournal);
        }
    }
}
