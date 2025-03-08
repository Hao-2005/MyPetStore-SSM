package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.csu.petstore.entity.Category;
import org.csu.petstore.entity.LineItem;
import org.csu.petstore.entity.Product;
import org.csu.petstore.persistence.CategoryMapper;
import org.csu.petstore.persistence.ProductMapper;
import org.csu.petstore.service.ItemService;
import org.csu.petstore.service.OrderService;
import org.csu.petstore.service.ProductService;
import org.csu.petstore.vo.OrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;

    @Autowired
    ItemService itemService;

    @Autowired
    OrderService orderService;

    @Autowired
    CategoryMapper categoryMapper;

    //获得订单所有的line item
    private List<LineItem> getAllLineItemsInOrders(String userId){
        //init
        LineItem lineItem = new LineItem();
        List<LineItem> lineItemList = new ArrayList<LineItem>();

        //get user orders
        List<OrderVo> orderList= orderService.getUserOrders(userId);

        //view all line items in all orders
        for(int i=0;i<orderList.size();i++){
            for(int j=0;j<orderList.get(i).getLineItems().size();j++){
                lineItem = orderList.get(i).getLineItems().get(j);
                lineItemList.add(lineItem);
            }
        }

        return lineItemList;
    }

    //删除list中有相同itemId的line item
    private void deleteItemInSameId(List<LineItem> list){
        //init
        LineItem lineItem;

        //delete
        for(int i=0;i<list.size();i++){
            lineItem = list.get(i);
            for(int j=i+1;j<list.size();j++){
                if(list.get(j).getItemId().equals(lineItem.getItemId())){
                    list.remove(j);
                    j--;
                }
            }
        }

    }

    //获得购买物品的对应itemId
    private List<String> getItemIdOfUserBoughtProduct(String userId) {
        //init
        List<LineItem> lineItemList = getAllLineItemsInOrders(userId);
        deleteItemInSameId(lineItemList);
        List<String> result = new ArrayList<String>();

        //Line item transfer to itemId
        for(int i=0;i<lineItemList.size();i++){
            result.add(lineItemList.get(i).getItemId());
        }

        return result;
    }

    //删除相同的productId
    private void deleteSameProductId(List<String> list) {
        //init
        String productId;

        //delete
        for(int i=0;i<list.size();i++){
            productId = list.get(i);
            for(int j=i+1;j<list.size();j++){
                if(list.get(j).equals(productId)){
                    list.remove(j);
                    j--;
                }
            }
        }
    }

    @Override
    public List<Product> getUserBoughtProduct(String userId) {
        //init
        List<Product> result = new ArrayList<Product>();
        List<String> itemIds = getItemIdOfUserBoughtProduct(userId);
        List<String> productIds = new ArrayList<String>();
        Product product = new Product();
        String itemId = "";
        String productId = "";

        //transfer itemId to ProductId
        for(int i=0;i<itemIds.size();i++){
            itemId = itemIds.get(i);
            productId = itemService.getProductIdByItemId(itemId);
            productIds.add(productId);
        }
        deleteSameProductId(productIds);

        //transfer productId to product objects
        for(int i=0;i<productIds.size();i++){
            product = productMapper.selectById(productIds.get(i));
            result.add(product);
        }

        return result;
    }

    @Override
    public void updateProductImage(String productId, String image) {
        String des = "<image src=\"" + image + "\"><span id=\"itemDescription\">Fresh Water fish from Japan</span>";
        UpdateWrapper<Product> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("productId", productId).set("descn", des);
        productMapper.update(updateWrapper);
    }

    @Override
    public void updateCategoryImage(String categoryId, String image) {
        String des = "<image src=\"" + image + "\"><font size=\"5\" color=\"blue\"> Birds</font>";
        UpdateWrapper<Category> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("catid", categoryId).set("descn", des);
        categoryMapper.update(updateWrapper);
    }
}
