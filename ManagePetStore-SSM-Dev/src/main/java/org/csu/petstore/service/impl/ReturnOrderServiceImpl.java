package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.Order;
import org.csu.petstore.entity.OrderStatus;
import org.csu.petstore.entity.ReturnOrders;
import org.csu.petstore.persistence.OrderMapper;
import org.csu.petstore.persistence.OrderStatusMapper;
import org.csu.petstore.persistence.ReturnOrdersMapper;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.service.ReturnOrderService;
import org.csu.petstore.vo.ReturnOrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("returnOrderService")
public class ReturnOrderServiceImpl implements ReturnOrderService
{
    @Autowired
    ReturnOrdersMapper returnOrdersMapper;

    @Autowired
    OrderStatusMapper orderStatusMapper;

    @Autowired
    OrderService orderService;

    @Override
    public List<ReturnOrderVo> getAllReturnOrders()
    {
        QueryWrapper<ReturnOrders> queryWrapper = new QueryWrapper<>();
        List<ReturnOrders> returnOrdersList = returnOrdersMapper.selectList(queryWrapper);
        List<ReturnOrderVo> returnOrderVoList = new ArrayList<>();
        for(ReturnOrders returnOrders : returnOrdersList)
        {
            ReturnOrderVo returnOrderVo = new ReturnOrderVo();
            returnOrderVo.setReturnOrder(returnOrders);
            returnOrderVo.setOrderVo(orderService.getOrderById(returnOrders.getOrderId()));
            returnOrderVoList.add(returnOrderVo);
        }
        return returnOrderVoList;
    }

    @Override
    public ReturnOrderVo getReturnOrderById(String orderId)
    {
        ReturnOrderVo returnOrderVo = new ReturnOrderVo();
        ReturnOrders returnOrders = returnOrdersMapper.selectById(orderId);
        returnOrderVo.setReturnOrder(returnOrders);
        returnOrderVo.setOrderVo(orderService.getOrderById(returnOrders.getOrderId()));
        return returnOrderVo;
    }

    @Override
    public void updateReturnOrderStatus(String orderId, boolean agree)
    {
        ReturnOrders returnOrders = returnOrdersMapper.selectById(orderId);
        OrderStatus orderStatus = orderStatusMapper.selectById(orderId);
        if(agree)  //同意取消订单
        {
            returnOrders.setStatus("N");
            orderStatus.setStatus("N");
        }
        else  //拒绝取消订单
        {
            returnOrders.setStatus("P");
            orderStatus.setStatus("P");
        }

        returnOrdersMapper.updateById(returnOrders);
        orderStatusMapper.updateById(orderStatus);
    }
}
