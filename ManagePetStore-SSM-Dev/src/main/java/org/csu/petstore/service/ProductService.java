package org.csu.petstore.service;

import org.csu.petstore.entity.LineItem;
import org.csu.petstore.entity.Product;

import java.util.List;

public interface ProductService {
    public List<Product> getUserBoughtProduct(String userId);   //获得用户购买过的商品

    void updateProductImage(String productId,String image);

    void updateCategoryImage(String categoryId,String image);
}
