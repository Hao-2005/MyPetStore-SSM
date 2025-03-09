package org.csu.petstore.rest.restcontroller;

import org.csu.petstore.service.OrderService;
import org.csu.petstore.service.OrderStatusService;
import org.csu.petstore.vo.OrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/order")
public class OrderController {
    @Autowired
    OrderService orderService;

    @Autowired
    OrderStatusService orderStatusService;

    @GetMapping("/all")
    public List<OrderVo> getAllOrders() {
        return orderService.getAllOrders();
    }

    @GetMapping("/cancelling")
    public List<OrderVo> getCancellingOrders() {
        return orderService.getCancelingOrders();
    }

    @GetMapping("/cancelled")
    public List<OrderVo> getCancelledOrders() {
        return orderService.getCanceledOrders();
    }

    @GetMapping("/pending")
    public List<OrderVo> getPendingOrders() {
        return orderService.getDoingOrders();
    }

    @GetMapping("/done")
    public List<OrderVo> getDoneOrders() {
        return orderService.getDoneOrders();
    }

    @GetMapping("/handle/{orderId}")
    public boolean handleFinishOrder(
            @PathVariable(name="orderId") int orderId) {
        return orderStatusService.finishOrder(orderId);
    }
}
