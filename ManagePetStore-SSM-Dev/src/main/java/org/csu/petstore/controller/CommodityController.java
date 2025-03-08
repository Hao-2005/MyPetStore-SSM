package org.csu.petstore.controller;

import org.csu.petstore.entity.Item;
import org.csu.petstore.service.ProductService;
import org.csu.petstore.vo.ItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.csu.petstore.service.ItemService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/commodity")
public class CommodityController
{
    @Autowired
    private ItemService itemService;
    @Autowired
    private ProductService productService;

    @RequestMapping("/getAll")
    @ResponseBody
    public List<ItemVo> getAll() {
        List<ItemVo> items = itemService.getAllItems();
        return items;
    }

    @RequestMapping("/getItem")
    @ResponseBody
    public ItemVo getItem(@RequestParam("itemId") String itemId) {
        ItemVo itemVo =  itemService.getItemsByIds(List.of(itemId)).get(0);
        return itemVo;
    }

    @RequestMapping("/modifyStock")
    @ResponseBody
    public Map<String ,String> modifyStock(String itemId, int quantity) {
        int status;
        String message;
        if(itemService.updateInventoryByItem(itemId, quantity)){
            status = 1;
            message = "修改库存成功";
            Map<String,String> map = new HashMap<>();
            map.put("status", String.valueOf(status));
            map.put("message", message);
            return map;
        }else {
            status = 0;
            message = "修改库存失败";
            Map<String,String> map = new HashMap<>();
            map.put("status", String.valueOf(status));
            map.put("message", message);
            return map;
        }
    }

    @RequestMapping("/viewUpdateItem")
    @ResponseBody
    public ItemVo viewUpdateItem(@RequestParam("itemId") String itemId) {
        ItemVo itemVo =  itemService.getItemsByIds(List.of(itemId)).get(0);
        itemService.setItemModified(itemId,1);
        return itemVo;
    }

    @RequestMapping("/updateItem")
    @ResponseBody
    public String updateItem(ItemVo itemVo) {
        Item item = itemService.getItemById(itemVo.getItemId());
        item.setListPrice(itemVo.getListPrice());
        item.setUnitCost(itemVo.getUnitCost());
        item.setStatus(itemVo.getStatus());
        item.setAttribute1(itemVo.getAttribute1());
        item.setAttribute2(itemVo.getAttribute2());
        item.setAttribute3(itemVo.getAttribute3());
        item.setAttribute4(itemVo.getAttribute4());
        item.setProductId(itemVo.getProductId());
        itemService.updateItem(item);
        if(itemService.setItemModified(itemVo.getItemId(),0))
            return "success";
        else
            return "fail";
    }

    @RequestMapping("/deleteItem")
    @ResponseBody
    public String deleteItem(@RequestParam("itemId") String itemId) {
        if(itemService.setItemModified(itemId,2))
            return "success";
        else
            return "fail";
    }

    @RequestMapping("/changeProductImage")
    @ResponseBody
    public String changeProductImage(@RequestParam("productId") String productId,
                                     @RequestParam("newImageUrl") String newImage) {

        productService.updateProductImage(productId,newImage);
        return "success";
    }

    @RequestMapping("/updateCategoryImage")
    @ResponseBody
    public String updateCategoryImage(@RequestParam("category") String categoryId,
                                      @RequestParam("newImageUrl") String newImage) {
        productService.updateCategoryImage(categoryId, newImage);
        return "success";
    }

}