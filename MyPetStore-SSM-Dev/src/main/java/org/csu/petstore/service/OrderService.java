package org.csu.petstore.service;

import org.csu.petstore.entity.Sequence;
import org.csu.petstore.vo.OrderVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderService {
    Sequence getSequence(String name);
    void updateSequence(Sequence sequence);
    int getNextOrderId();

    List<OrderVO> getOrdersByUsername(String username);

    OrderVO getOrderWithLineItem(int orderId);

    void insertOrder(OrderVO order);

}
