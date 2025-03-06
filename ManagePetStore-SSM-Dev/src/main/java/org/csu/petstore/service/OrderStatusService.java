package org.csu.petstore.service;

public interface OrderStatusService {
    public boolean finishOrder(int orderId);
    public boolean cancelOrder(int orderId);
}
