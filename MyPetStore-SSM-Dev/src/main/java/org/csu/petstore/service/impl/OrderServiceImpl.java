package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.LineItem;
import org.csu.petstore.entity.OrderStatus;
import org.csu.petstore.entity.Orders;
import org.csu.petstore.entity.Sequence;
import org.csu.petstore.persistence.LineItemMapper;
import org.csu.petstore.persistence.OrderStatusMapper;
import org.csu.petstore.persistence.OrdersMapper;
import org.csu.petstore.persistence.SequenceMapper;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.LineItemVO;
import org.csu.petstore.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private SequenceMapper sequenceMapper;
    @Autowired
    private OrdersMapper ordersMapper;
    @Autowired
    private OrderStatusMapper orderStatusMapper;
    @Autowired
    private LineItemMapper lineItemMapper;
    @Autowired
    private CatalogService catalogService;


    @Override
    public Sequence getSequence(String name) {
        return sequenceMapper.selectById(name);
    }

    @Override
    public void updateSequence(Sequence sequence) {
        sequenceMapper.updateById(sequence);
    }

    @Override
    public int getNextOrderId() {
        Sequence sequence = getSequence("ordernum");
        Sequence nextSequence = getSequence("ordernum");
        nextSequence.setNextId(nextSequence.getNextId() + 1);
        sequenceMapper.updateById(sequence);
        return nextSequence.getNextId();
    }

    @Override
    public List<OrderVO> getOrdersByUsername(String username) {
        QueryWrapper<Orders> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", username);
        List<Orders> ordersList = ordersMapper.selectList(queryWrapper);
        List<OrderVO> orderVOList = new ArrayList<>();
        for (Orders order : ordersList) {
            OrderVO orderVO = new OrderVO();
            orderVO.setOrders(order);
            orderVO.setStatus(orderStatusMapper.selectById(order.getOrderId()).getStatus());
            orderVOList.add(orderVO);
        }
        return orderVOList;
    }

    @Override
    public OrderVO getOrderWithLineItem(int orderId) {
        OrderVO orderVO = new OrderVO();
        orderVO.setOrders(ordersMapper.selectById(orderId));
        orderVO.setStatus(orderStatusMapper.selectById(orderId).getStatus());
        QueryWrapper<LineItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("orderid", orderId);
        List<LineItem> lineItemList = lineItemMapper.selectList(queryWrapper);
        for (LineItem lineItem : lineItemList) {
            ItemVO itemVO = catalogService.getItem(lineItem.getItemId());
            LineItemVO lineItemVO= new LineItemVO();
            lineItemVO.setLineItem(lineItem);
            orderVO.addLineItem(lineItemVO);
        }
        return orderVO;
    }

    @Override
    public void insertOrder(OrderVO order) {
        System.out.println("insert order");
        System.out.println(order.getOrders().getOrderId());
        ordersMapper.insert(order.getOrders());
        orderStatusMapper.insert(order.getOrderStatus());
        for (LineItemVO lineItemVO : order.getLineItems()) {
            System.out.println("insert line item");
            lineItemMapper.insert(lineItemVO.getLineItem());
            System.out.println(lineItemVO.getLineItem());
        }
        System.out.println("insert order");
    }

}
