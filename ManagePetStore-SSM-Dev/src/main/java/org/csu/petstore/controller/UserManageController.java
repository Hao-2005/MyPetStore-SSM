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

        model.addAttribute("user",accountService.getAllUser());
        return "ManageUser/manageUser";
    }

    @GetMapping("/manageUser/resetPassword")
    public String resetPassword(Model model){
        model.addAttribute("user",resetPasswordService.getResetPasswordUserId());
        return "ManageUser/resetPassword";
    }

    @GetMapping("/manageUser/resetPassword/reset")
    public String doResetPassword(@RequestParam("userId") String userId, Model model){
        if(userId == null){
            return "redirect:/manageUser/resetPassword";
        }
        resetPasswordService.resetDefaultPassword(userId);
        model.addAttribute("user",resetPasswordService.getResetPasswordUserId());
        return "ManageUser/resetPassword";
    }

    @GetMapping("/manageUser/userInfo")
    public String userInfo(Model model){
        model.addAttribute("user",accountService.getAllUser());
        return "ManageUser/userInfo";
    }

    @GetMapping("/manageUser/userInfo/seeInfo")
    public String seeInfo(@RequestParam("userId") String userId,Model model){
        if(userId == null){
            return "redirect:/manageUser/userInfo";
        }
        model.addAttribute("user",userId);
        model.addAttribute("bought",productService.getUserBoughtProduct(userId));
        model.addAttribute("interest",productJournalService.getThreeMostViewProducts(userId));
        model.addAttribute("cancelingOrder",orderService.getUserCancelingOrders(userId));
        model.addAttribute("canceledOrder",orderService.getUserCanceledOrders(userId));
        return "ManageUser/seeUserInfo";
    }
}
