package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.Order;
import org.csu.petstore.entity.OrderStatus;
import org.csu.petstore.persistence.OrderMapper;
import org.csu.petstore.persistence.OrderStatusMapper;
import org.csu.petstore.service.LineItemService;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.service.OrderStatusService;
import org.csu.petstore.vo.OrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderStatusMapper orderStatusMapper;

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    LineItemService lineItemService;

    @Override
    public List<OrderVo> getUserOrders(String userId) {
        //init
        List<OrderVo> orderVos = new ArrayList<OrderVo>();

        //get orders
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userId);
        List<Order> orders = orderMapper.selectList(queryWrapper);

        for(int i=0;i<orders.size();i++){
            Order order = orders.get(i);
            OrderVo orderVo = new OrderVo(order);

            //get Status
            OrderStatus orderStatus = orderStatusMapper.selectById(order.getOrderId());
            if (orderStatus == null) {
                orderStatus = new OrderStatus();
                orderStatus.setOrderId(order.getOrderId());
                orderStatus.setStatus("Error"); // 设置默认状态
            }

            orderVo.setStatus(orderStatus.getStatus());

            //get order line items
            orderVo.setLineItems(lineItemService.getLineItemsById(order.getOrderId()));

            orderVos.add(orderVo);
        }
        return orderVos;
    }

    @Override
    public List<OrderVo> getUserDoingOrders(String userId) {
        //init
        List<OrderVo> orderVos = getUserOrders(userId);
        List<OrderVo> result = new ArrayList<>();

        //choose status = P
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("P")){
                result.add(orderVo);
            }
        }

        return result;
    }

    @Override
    public List<OrderVo> getUserDoneOrders(String userId) {
        //init
        List<OrderVo> orderVos = getUserOrders(userId);
        List<OrderVo> result = new ArrayList<>();

        //choose status = F
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("F")){
                result.add(orderVo);
            }
        }

        return result;
    }

    @Override
    public List<OrderVo> getUserCancelingOrders(String userId) {
        //init
        List<OrderVo> orderVos = getUserOrders(userId);
        List<OrderVo> result = new ArrayList<>();

        //choose status = W
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("W")){
                result.add(orderVo);
            }
        }

        return result;
    }

    @Override
    public List<OrderVo> getUserCanceledOrders(String userId) {
        //init
        List<OrderVo> orderVos = getUserOrders(userId);
        List<OrderVo> result = new ArrayList<>();

        //choose status = N
        for(int i=0;i<orderVos.size();i++){
            OrderVo orderVo = orderVos.get(i);
            String status = orderVo.getStatus();
            if(status.equals("N")){
                result.add(orderVo);
            }
        }

        return result;
    }
}
