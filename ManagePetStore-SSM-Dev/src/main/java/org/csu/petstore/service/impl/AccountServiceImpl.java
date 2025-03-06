package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.Account;
import org.csu.petstore.entity.SignOn;
import org.csu.petstore.persistence.AccountMapper;
import org.csu.petstore.persistence.SignOnMapper;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountMapper accountMapper;

    @Autowired
    private SignOnMapper signOnMapper;

    @Override
    public List<UserVo> getAllUser() {
        List<Account> accounts = accountMapper.selectList(new QueryWrapper<>());

        List<UserVo> userVos = accounts.stream().map(account -> {
            // 根据 account 查询关联的 SignOn 数据（假设通过 accountId 关联）
            SignOn signOn = signOnMapper.selectOne(
                    new QueryWrapper<SignOn>().eq("username", account.getUserId())
            );

            // 构建 UserVo
            UserVo userVo = new UserVo();
            userVo.setUserId(account.getUserId());
            userVo.setUserEmail(account.getUserEmail());
            userVo.setFirstName(account.getFirstName());
            userVo.setLastName(account.getLastName());
            userVo.setStatus(account.getStatus());
            userVo.setAddress1(account.getAddress1());
            userVo.setAddress2(account.getAddress2());
            userVo.setCity(account.getCity());
            userVo.setState(account.getState());
            userVo.setZip(account.getZip());
            userVo.setCountry(account.getCountry());
            userVo.setPhone(account.getPhone());

            userVo.setPassword(signOn.getPassword());

            return userVo;
        }).toList();

        return userVos;
    }
}
