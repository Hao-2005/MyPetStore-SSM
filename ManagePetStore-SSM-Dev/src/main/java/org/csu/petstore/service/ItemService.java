package org.csu.petstore.service;

import org.csu.petstore.entity.Item;
import org.csu.petstore.vo.ItemVo;

import java.util.List;

public interface ItemService {
    public List<ItemVo> getItemsByIds(List<String> ids);
    public String getProductIdByItemId(String itemId);

    public Item getItemById(String itemId);

    public boolean updateInventoryByItem(String itemId, int quantity); //更新库存

    public boolean updateItem(Item item); //更新商品信息
    public boolean setItemModified(String itemId,int modified); //设置商品是否被修改,0为未修改,1为修改,2为删除

    public List<ItemVo> getAllItems();
}
