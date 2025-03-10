package org.csu.petstore.rest.restcontroller;

import org.csu.petstore.service.*;
import org.csu.petstore.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/customer")
public class CustomerController {

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

    @GetMapping("/findAll")
    public List<UserVo> findAll() {
        return accountService.getAllUser();
    }

    @GetMapping("/detail/{userId}")
    public Map<String, Object> getUserDetail(
            @PathVariable(name="userId") String userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("user", userId);
        map.put("bought",productService.getUserBoughtProduct(userId));
        map.put("interest",productJournalService.getThreeMostViewProducts(userId));
        map.put("cancelingOrder",orderService.getUserCancelingOrders(userId));
        map.put("canceledOrder",orderService.getUserCanceledOrders(userId));
        return map;
    }

    @GetMapping("/findForget")
    public List<String> findAllResetPasswordUserId() {
        return resetPasswordService.getResetPasswordUserId();
    }

    @GetMapping("/resetPassword/{userId}")
    public List<String> resetPassword(
            @PathVariable(name="userId") String userId) {
        Map<String, Boolean> map = new HashMap<>();
        resetPasswordService.resetDefaultPassword(userId);
        return resetPasswordService.getResetPasswordUserId();
    }
}
