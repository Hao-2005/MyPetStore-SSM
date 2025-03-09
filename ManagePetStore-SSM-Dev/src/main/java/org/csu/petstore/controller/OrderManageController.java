package org.csu.petstore.controller;

import org.csu.petstore.service.OrderService;
import org.csu.petstore.service.OrderStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderManageController {
    @Autowired
    OrderService orderService;

    @Autowired
    OrderStatusService orderStatusService;

    @GetMapping("/manageOrder")
    public String manageOrder(Model model) {
        model.addAttribute("order", orderService.getDoingOrders());  // 改为显示待处理订单
      return "ManageOrder/manageOrder";
    }

    @GetMapping("/manageOrder/doing")
    public String getDoingOrders(Model model) {
        model.addAttribute("order", orderService.getDoingOrders());
        return "ManageOrder/manageOrder :: #orderTableBody";
    }

    @GetMapping("/manageOrder/done")
    public String getDoneOrders(Model model) {
        model.addAttribute("order", orderService.getDoneOrders());
        return "ManageOrder/manageOrder :: #orderTableBody";
    }

    @GetMapping("/manageOrder/canceling")
    public String getCancelingOrders(Model model) {
        model.addAttribute("order", orderService.getCancelingOrders());
        return "ManageOrder/manageOrder :: #orderTableBody";
    }

    @GetMapping("/manageOrder/canceled")
    public String getCanceledOrders(Model model) {
        model.addAttribute("order", orderService.getCanceledOrders());
        return "ManageOrder/manageOrder :: #orderTableBody";
    }

    @GetMapping("/manageOrder/finish")
    public String handleFinishOrder(@RequestParam("orderId") int orderId, Model model) {
        orderStatusService.finishOrder(orderId);
        model.addAttribute("order", orderService.getDoingOrders());
        return "ManageOrder/manageOrder :: #orderTableBody";
    }
}