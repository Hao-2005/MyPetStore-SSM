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
        model.addAttribute("order",orderService.getAllOrders());
        return "ManageOrder/manageOrder";
    }

    @GetMapping("/manageOrder/seeCancelingOrder")
    public String seeCancelingOrder(Model model) {
        model.addAttribute("order",orderService.getCancelingOrders());
        return "ManageOrder/cancelingOrder";
    }

//    @GetMapping("/manageOrder/seeCancelingOrder/handleCancel")
//    public String handleCancelOrder(@RequestParam("orderId") int orderId,Model model) {
//        orderStatusService.cancelOrder(orderId);
//        model.addAttribute("order",orderService.getCancelingOrders());
//        return "ManageOrder/cancelingOrder";
//    }

    @GetMapping("/manageOrder/seeCanceledOrder")
    public String seeCanceledOrder(Model model) {
        model.addAttribute("order",orderService.getCanceledOrders());
        return "ManageOrder/canceledOrder";
    }

    @GetMapping("/manageOrder/seeDoingOrder")
    public String seeDoingOrder(Model model) {
        model.addAttribute("order",orderService.getDoingOrders());
        return "ManageOrder/doingOrder";
    }

    @GetMapping("/manageOrder/seeDoingOrder/handleFinish")
    public String handleFinishOrder(@RequestParam("orderId") int orderId,Model model) {
        orderStatusService.finishOrder(orderId);
        model.addAttribute("order",orderService.getDoingOrders());
        return "ManageOrder/doingOrder";
    }

    @GetMapping("/manageOrder/seeDoneOrder")
    public String seeDoneOrder(Model model) {
        model.addAttribute("order",orderService.getDoneOrders());
        return "ManageOrder/doneOrder";
    }
}
