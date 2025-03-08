package org.csu.petstore.rest.restcontroller;

import org.csu.petstore.service.ReturnOrderService;
import org.csu.petstore.vo.ReturnOrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/refund")
public class RefundController {

    private final ReturnOrderService returnOrderService;

    @Autowired
    public RefundController(ReturnOrderService returnOrderService) {
        this.returnOrderService = returnOrderService;
    }

    @GetMapping("/all")
    public List<ReturnOrderVo> getAllReturnOrders() {
        return returnOrderService.getAllReturnOrders();
    }

    @GetMapping("/detail/{orderId}")
    public ResponseEntity<Map<String, Object>> getReturnOrderById(
            @PathVariable(name="orderId") String orderId) throws IOException {

        ReturnOrderVo returnOrdervo = returnOrderService.getReturnOrderById(orderId);
        Map<String, Object> map = new HashMap<>();
        map.put("returnOrderVo", returnOrdervo);
        String imgPath = System.getProperty("user.dir") + returnOrdervo.getReturnOrder().getImage();

        File imageFile = new File(imgPath);

        if (!imageFile.exists())
        {
           map.put("imageBase64", "");
        }
        else
        {
            //读取文件并转换为Base64
            byte[] imageBytes = Files.readAllBytes(imageFile.toPath());
            String base64 = Base64.getEncoder().encodeToString(imageBytes);
            String base64Image = "data:image/jpeg;base64," + base64;
            map.put("imageBase64", base64Image);
        }
        return ResponseEntity.ok(map);
    }

    @GetMapping("/process/{orderId}/{option}")
    public ResponseEntity<Map<String, String>> process(
            @PathVariable(name="orderId") String orderId,
            @PathVariable(name="option") Boolean option
    ) {
        String msg = "";
        returnOrderService.updateReturnOrderStatus(orderId, option);
        if (option) {
            msg = "You successfully agreed the return request for the order #" + orderId;
        } else {
            msg = "You successfully refused the return request for the order #" + orderId;
        }
        return ResponseEntity.ok(Map.of("msg", msg));
    }
}
