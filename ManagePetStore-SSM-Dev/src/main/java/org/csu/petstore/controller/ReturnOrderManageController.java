package org.csu.petstore.controller;

import org.csu.petstore.service.ReturnOrderService;
import org.csu.petstore.vo.ReturnOrderVo;
import org.springframework.aop.scope.ScopedProxyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping("/manageReturnOrders")
public class ReturnOrderManageController
{
    @Autowired
    private ReturnOrderService returnOrderService;

    @GetMapping("viewReturnOrders")
    public String viewReturnOrders(Model model)
    {
        List<ReturnOrderVo> returnOrders = returnOrderService.getAllReturnOrders();
        model.addAttribute("returnOrderList", returnOrders);
        return "ManageReturnOrders/manageReturnOrder";
    }

    @GetMapping("viewReason")
    public String viewReason(String orderId, Model model) throws IOException {
        ReturnOrderVo returnOrder = returnOrderService.getReturnOrderById(orderId);

        //处理图片
        String imgPath = System.getProperty("user.dir") + returnOrder.getReturnOrder().getImage();
        File imageFile = new File(imgPath);

        if (!imageFile.exists())
        {
            model.addAttribute("imageBase64", "");
        }
        else
        {
            //读取文件并转换为Base64
            byte[] imageBytes = Files.readAllBytes(imageFile.toPath());
            String base64 = Base64.getEncoder().encodeToString(imageBytes);
            String base64Image = "data:image/jpeg;base64," + base64;
            model.addAttribute("image", base64Image);
        }

        model.addAttribute("returnOrder", returnOrder);
        return "ManageReturnOrders/viewReturnReason";
    }

    @PostMapping("processRequest")
    public String processRequest(String orderId, String result, Model model)
    {
        String msg;
        if(result.equals("Agree"))  //同意取消订单
        {
            returnOrderService.updateReturnOrderStatus(orderId, true);
            msg = "You successfully agreed the return request for the order " + orderId;
        }
        else  //拒绝取消订单
        {
            returnOrderService.updateReturnOrderStatus(orderId, false);
            msg = "You successfully refused the return request for the order " + orderId;
        }

        model.addAttribute("msg", msg);
        List<ReturnOrderVo> returnOrders = returnOrderService.getAllReturnOrders();
        model.addAttribute("returnOrderList", returnOrders);
        return "ManageReturnOrders/manageReturnOrder";
    }
}
