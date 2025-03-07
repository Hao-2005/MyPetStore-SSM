package org.csu.petstore;

import org.csu.petstore.entity.Category;
import org.csu.petstore.persistence.*;
import org.csu.petstore.service.*;
import org.csu.petstore.service.impl.AccountServiceImpl;
import org.csu.petstore.service.impl.LineItemServiceImpl;
import org.csu.petstore.service.impl.OrderServiceImpl;
import org.csu.petstore.service.impl.ResetPasswordServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class ManagePetStoreSsmDevApplicationTests {
    @Autowired
    OrderService OrderService;

    @Autowired
    AccountService accountService;

    @Autowired
    SignOnService signOnService;

    @Autowired
    OrderStatusService orderStatusService;

    @Autowired
    private OrderServiceImpl orderService;

    @Autowired
    ProductJournalService productJournalService;

    @Autowired
    ResetPasswordServiceImpl resetPasswordService;

    @Test
    void contextLoads() {
//        List<String> list = new ArrayList<>();
//        list.add("EST-1");
//        list.add("EST-2");
//        System.out.println(itemService.getItemsByIds(list));
//        System.out.println(orderStatusService.cancelOrder(1006));

//        System.out.println(productJournalService.getViewTimeByUserId("j2ee"));
//        System.out.println(productJournalService.getThreeMostViewProducts("ACID"));

//        System.out.println(orderService.getUserCancelingOrders("j2ee"));
        System.out.println(resetPasswordService.resetDefaultPassword("j2ee"));
    }
}
