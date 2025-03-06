package org.csu.petstore;

import org.csu.petstore.entity.Category;
import org.csu.petstore.persistence.*;
import org.csu.petstore.service.*;
import org.csu.petstore.service.impl.AccountServiceImpl;
import org.csu.petstore.service.impl.LineItemServiceImpl;
import org.csu.petstore.service.impl.OrderServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class ManagePetStoreSsmDevApplicationTests {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    OrderService OrderService;

    @Autowired
    OrderStatusService orderStatusService;

    @Autowired
    private OrderServiceImpl orderService;


    @Test
    void contextLoads() {
        System.out.println(orderStatusService.cancelOrder(1006));
    }
}
