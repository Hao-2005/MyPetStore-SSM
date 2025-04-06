package org.csu.petstore.controller;

import org.csu.petstore.entity.Product;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value={"/catalog", "/common"})
@SessionAttributes(value = {"productList"})
public class CatalogController {

    @Autowired
    private CatalogService catalogService;

    @GetMapping("/index")
    public String index()
    {
        return "catalog/main";
    }

    @GetMapping("/viewCategory")
    public String viewCategory(String categoryId, Model model)
    {
        CategoryVO category = catalogService.getCategory(categoryId);
        model.addAttribute("category", category);
        return "catalog/category";
    }

    @GetMapping("/category/{categoryId}")
    public CategoryVO viewCategory(@PathVariable String categoryId)
    {
        CategoryVO category = catalogService.getCategory(categoryId);
        return category;
    }

    @GetMapping("/returnMain")
    public String returnMain(Model model)
    {
        return "catalog/main";
    }

    @GetMapping("/viewProduct")
    public String viewProduct(String productId, Model model)
    {
        ProductVO product = catalogService.getProduct(productId);
        model.addAttribute("product", product);
        return "catalog/product";
    }

    @GetMapping("/product/{productId}")
    public ProductVO viewProduct(@PathVariable String productId)
    {
        return catalogService.getProduct(productId);
    }

    @GetMapping("/viewItem")
    public String viewItem(String itemId, Model model)
    {
        ItemVO item = catalogService.getItem(itemId);
        ProductVO product = catalogService.getProduct(item.getProductId());
        model.addAttribute("item", item);
        model.addAttribute("product", product);
        return "catalog/item";
    }

    @GetMapping("/item/{itemId}")
    public ItemVO viewItem(@PathVariable String itemId)
    {
        return catalogService.getItem(itemId);
    }

    @GetMapping("/search")
    public String search(String keyword, Model model){
        List<Product> productList = catalogService.getProductList(keyword);
        model.addAttribute("productList", productList);
        return "catalog/searchProduct";
    }

    @GetMapping("/search/{keyword}")
    public List<Product> search(@PathVariable  String keyword){
        return catalogService.getProductList(keyword);
    }

    @GetMapping("/hello")
    public ResponseEntity<Map<String, String>> sayHello() {

        return ResponseEntity.ok().body(Map.of("Message", "Hello", "Time", "2025-04-06"));
    }
}
