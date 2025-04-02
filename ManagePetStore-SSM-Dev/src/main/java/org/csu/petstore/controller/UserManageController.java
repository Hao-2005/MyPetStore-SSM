package org.csu.petstore.controller;

import org.csu.petstore.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserManageController {
    @Autowired
    AccountService accountService;

    @Autowired
    ResetPasswordService resetPasswordService;

    @Autowired
    ProductService productService;

    @Autowired
    ProductJournalService productJournalService;

    @Autowired
    OrderService orderService;

   
    @GetMapping("/manageUser")
    public String manageUser(Model model) {
        model.addAttribute("user", accountService.getAllUser());
        return "ManageUser/manageUser";
    }

    @GetMapping("/manageUser/resetPassword/list")
    public String getResetPasswordList(Model model) {
        model.addAttribute("resetUsers", resetPasswordService.getResetPasswordUserId());
        return "ManageUser/manageUser :: #resetPasswordContent";
    }

    @GetMapping("/manageUser/resetPassword/reset")
    public String doResetPassword(@RequestParam("userId") String userId, Model model) {
        if(userId == null) {
            return "redirect:/manageUser";
        }
        resetPasswordService.resetDefaultPassword(userId);
        model.addAttribute("resetUsers", resetPasswordService.getResetPasswordUserId());
        return "ManageUser/manageUser :: #resetPasswordContent";
    }

    @GetMapping("/manageUser/userInfo/detail")
    public String getUserDetail(@RequestParam("userId") String userId, Model model) {
        if(userId == null) {
            return "redirect:/manageUser";
        }
        model.addAttribute("userId", userId);
        model.addAttribute("bought", productService.getUserBoughtProduct(userId));
        model.addAttribute("interest", productJournalService.getThreeMostViewProducts(userId));
        model.addAttribute("cancelingOrder", orderService.getUserCancelingOrders(userId));
        model.addAttribute("canceledOrder", orderService.getUserCanceledOrders(userId));
        return "ManageUser/manageUser :: #userDetailContent";
    }
}
