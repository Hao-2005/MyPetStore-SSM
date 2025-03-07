package org.csu.petstore.rest.service;

import org.csu.petstore.rest.entity.Admin;
import org.csu.petstore.rest.persistence.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {



    private AdminMapper adminMapper;

    @Autowired
    public AdminService(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    public boolean findByUsernameAndPassword(String username, String password) {
        Admin admin = adminMapper
                .findByUsernameAndPassword(username, password);
        if (admin == null) {
            return false;
        }
        return admin.getPassword().equals(password);
    }

    public boolean findByUsername(String username) {
        return adminMapper.findByUsername(username) != null;
    }

    public int insert(String username, String password) {
        return adminMapper.insert(username, password);
    }
}
