package org.csu.petstore.service.impl;

import org.csu.petstore.entity.SignOn;
import org.csu.petstore.persistence.SignOnMapper;
import org.csu.petstore.service.SignOnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("signOnService ")
public class SignOnServiceImpl implements SignOnService {
    @Autowired
    SignOnMapper signOnMapper;

    @Override
    public boolean changePassword(String userId, String newPassword) {
        SignOn signOn = new SignOn();
        signOn.setUserId(userId);
        signOn.setPassword(newPassword);
        signOnMapper.updateById(signOn);
        return true;
    }
}
