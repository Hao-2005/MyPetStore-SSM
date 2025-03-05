package org.csu.petstore.controller;

import org.csu.petstore.entity.Product;
import org.csu.petstore.service.CatalogService;
import org.csu.petstore.vo.CategoryVO;
import org.csu.petstore.vo.ItemVO;
import org.csu.petstore.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@RequestMapping("/catalog")
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

    @GetMapping("/viewItem")
    public String viewItem(String itemId, Model model)
    {
        ItemVO item = catalogService.getItem(itemId);
        ProductVO product = catalogService.getProduct(item.getProductId());
        model.addAttribute("item", item);
        model.addAttribute("product", product);
        return "catalog/item";
    }

    @GetMapping("/search")
    public String search(String keyword, Model model){
        List<Product> productList = catalogService.getProductList(keyword);
        model.addAttribute("productList", productList);
        return "catalog/searchProducts";
    }
}
