package org.csu.petstore.service;

import java.util.List;

public interface ResetPasswordService {
    public List<String> getResetPasswordUserId();   //获得重置密码的用户
    public boolean resetDefaultPassword(String userId);    //重置密码 返回True修改成功
}
