package org.csu.petstore;

import org.csu.petstore.entity.Category;
import org.csu.petstore.persistence.AccountMapper;
import org.csu.petstore.persistence.CategoryMapper;
import org.csu.petstore.persistence.SignOnMapper;
import org.csu.petstore.rest.entity.SellSummary;
import org.csu.petstore.rest.persistence.SellsMapper;
import org.csu.petstore.rest.service.SellService;
import org.csu.petstore.service.AccountService;
import org.csu.petstore.service.impl.AccountServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

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

    private SellService sellsService;

    @Autowired
    public void setSellsService(SellService sellsService) {
        this.sellsService = sellsService;
    }

    @Test
    public void testGetSellSummariesBetweenDates() {

        List<SellSummary> sellSummaries = sellsService.getSellSummariesBetweenDates("2024-01-01", "2024-02-05");
        assertNotNull(sellSummaries);
        assertTrue(sellSummaries.size() > 0);
    }

    private SellsMapper sellsMapper;

    @Autowired
    public void setSellsMapper(SellsMapper sellsMapper) {
        this.sellsMapper = sellsMapper;
    }

    @Test
    public void testMapperGetSellSummariesBetweenDates() {
        List<SellSummary> sellSummaries = sellsMapper.getSellSummariesBetweenDates("2024-01-01", "2024-02-05");
        assertNotNull(sellSummaries);
        assertTrue(sellSummaries.size() > 0);
    }
}
