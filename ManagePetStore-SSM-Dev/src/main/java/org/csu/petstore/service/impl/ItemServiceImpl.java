package org.csu.petstore.service.impl;

import org.csu.petstore.entity.Item;
import org.csu.petstore.entity.Product;
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

    @Override
    public List<ItemVo> getItemsByIds(List<Integer> ids) {
        List<ItemVo> itemVos = new ArrayList<ItemVo>();
        Item item;
        Product product;
        for (int i = 0; i < ids.size(); i++) {
            item = itemMapper.selectById(ids.get(i));
            product = productMapper.selectById(item.getProductId());
            ItemVo itemVo = new ItemVo(item);
            itemVo.setProductName(product.getName());
            itemVo.setViewTime(0);  //浏览次数 后期修改
            itemVos.add(itemVo);
        }
        return itemVos;
    }
}
