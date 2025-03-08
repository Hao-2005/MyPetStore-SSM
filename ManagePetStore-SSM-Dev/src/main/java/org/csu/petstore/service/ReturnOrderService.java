package org.csu.petstore.service;

import org.csu.petstore.vo.ReturnOrderVo;

import java.util.List;

public interface ReturnOrderService
{
    public List<ReturnOrderVo> getAllReturnOrders();
    public ReturnOrderVo getReturnOrderById(String orderId);
    public void updateReturnOrderStatus(String orderId, boolean agree);
}
