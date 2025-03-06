package org.csu.petstore.service;

import org.csu.petstore.vo.OrderVo;

import java.util.List;

public interface OrderService {
    public List<OrderVo> getUserOrders(String userId);
}
