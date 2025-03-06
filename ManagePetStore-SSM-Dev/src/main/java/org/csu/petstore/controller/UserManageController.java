package org.csu.petstore.controller;

import org.csu.petstore.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserManageController {
    @Autowired
    AccountService accountService;

    @GetMapping("/manageUser")
    public String manageUser(Model model) {

        model.addAttribute("user",accountService.getAllUser());
        return "ManageUser/manageUser";
    }

    @GetMapping("/manageUser/resetPassword")
    public String resetPassword(Model model){
        return "";
    }

    @GetMapping("/manageUser/userInfo")
    public String userInfo(Model model){
        return "";
    }
}
