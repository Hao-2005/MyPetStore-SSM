package org.csu.petstore.service;

import org.csu.petstore.vo.OrderVo;

import java.util.List;

public interface OrderService {
    public List<OrderVo> getUserOrders(String userId);  //获得用户的所有订单
    public List<OrderVo> getUserCancelingOrders(String userId); //获得用户正在取消的订单
    public List<OrderVo> getUserCanceledOrders(String userId);  //获得用户已取消的订单
}
