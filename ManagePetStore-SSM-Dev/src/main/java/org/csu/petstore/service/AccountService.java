package org.csu.petstore.service;

import org.csu.petstore.entity.Account;
import org.csu.petstore.vo.UserVo;

import java.util.List;

public interface AccountService {
    public List<UserVo> getAllUser();
}
