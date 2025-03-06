package org.csu.petstore;

import org.csu.petstore.entity.Category;
import org.csu.petstore.persistence.AccountMapper;
import org.csu.petstore.persistence.CategoryMapper;
import org.csu.petstore.persistence.SignOnMapper;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.impl.AccountServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ManagePetStoreSsmDevApplicationTests {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private AccountMapper accountMapper;

    @Autowired
    private SignOnMapper signOnMapper;

    @Autowired
    AccountService accountService;


    @Test
    void contextLoads() {
        System.out.println(accountService.getAllUser());

    }
}
