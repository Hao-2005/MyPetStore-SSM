package org.csu.petstore.service;

import org.csu.petstore.entity.Account;
import org.csu.petstore.vo.UserVo;

import java.util.List;

public interface AccountService {
    public List<UserVo> getAllUser();   //获得所有用户的信息
    public String getUserLastFourPhoneChars(String userId);  //获得特定用户电话最后四位
}
