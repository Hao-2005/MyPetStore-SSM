package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.ResetPassword;
import org.csu.petstore.persistence.ResetPasswordMapper;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.ResetPasswordService;
import org.csu.petstore.service.SignOnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("resetPasswordService")
public class ResetPasswordServiceImpl implements ResetPasswordService {
    @Autowired
    private ResetPasswordMapper resetPasswordMapper;

    @Autowired
    private AccountService accountService;

    @Autowired
    private SignOnService signOnService;

    @Override
    public List<String> getResetPasswordUserId() {
        //init
        List<String> result = new ArrayList<String>();
        QueryWrapper<ResetPassword> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("status", 0);
        List<ResetPassword> list = resetPasswordMapper.selectList(queryWrapper);

        //give value
        for(int i=0;i<list.size();i++){
            ResetPassword resetPassword = list.get(i);
            result.add(resetPassword.getUserId());
        }

        return result;
    }

    @Override
    public boolean resetDefaultPassword(String userId) {
        //init
        ResetPassword resetPassword = resetPasswordMapper.selectById(userId);

        //check is the user need to reset
        if(resetPassword==null){
            return false;
        }

        //reset
        String newPsw = accountService.getUserLastFourPhoneChars(userId);
        signOnService.changePassword(userId, newPsw);

        //update status
        resetPassword.setStatus(1);
        resetPasswordMapper.updateById(resetPassword);

        return true;
    }
}
