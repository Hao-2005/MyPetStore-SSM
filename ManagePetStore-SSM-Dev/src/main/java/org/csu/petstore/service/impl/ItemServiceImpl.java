package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import org.csu.petstore.entity.Inventory;
import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.Product;
import org.csu.petstore.persistence.InventoryMapper;
import org.csu.petstore.persistence.ItemMapper;
import org.csu.petstore.persistence.ProductMapper;
import org.csu.petstore.service.ItemService;
import org.csu.petstore.vo.ItemVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("itemService")
public class ItemServiceImpl implements ItemService {

    @Autowired
    ItemMapper itemMapper;

    @Autowired
    ProductMapper productMapper;

    @Autowired
    InventoryMapper inventoryMapper;

    @Override
    public List<ItemVo> getItemsByIds(List<String> ids) {
        List<ItemVo> itemVos = new ArrayList<ItemVo>();
        Item item;
        Product product;
        for (int i = 0; i < ids.size(); i++) {
            item = itemMapper.selectById(ids.get(i));
            product = productMapper.selectById(item.getProductId());
            ItemVo itemVo = new ItemVo(item);
            itemVo.setProductName(product.getName());
            itemVos.add(itemVo);
        }
        return itemVos;
    }

    @Override
    public String getProductIdByItemId(String itemId) {
        Item item = itemMapper.selectById(itemId);
        return item.getProductId();
    }

    @Override
    public Item getItemById(String itemId) {
        return itemMapper.selectById(itemId);
    }

    @Override
    public boolean updateInventoryByItem(String itemId, int quantity) {
        UpdateWrapper<Inventory> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("itemid", itemId)
                .set("qty", quantity);
        if(inventoryMapper.update(updateWrapper)!=0)
            return true;
        else
            return false;
    }

    @Override
    public boolean updateItem(Item item) {
        return itemMapper.updateById(item) > 0;
    }

    @Override
    public boolean setItemModified(String itemId,int modified) {
        UpdateWrapper<Item> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("itemid", itemId)
                .set("modifying", modified);
        return itemMapper.update(updateWrapper) > 0;
    }

    @Override
    public List<ItemVo> getAllItems() {
        List<Item> items = itemMapper.selectList(null);
        List<ItemVo> itemVos = new ArrayList<ItemVo>();
        for (Item item : items) {
            ItemVo itemVo = new ItemVo(item);
            Product product = productMapper.selectById(item.getProductId());
            itemVo.setProductName(product.getName());
            itemVos.add(itemVo);
        }
        return itemVos;
    }
}
