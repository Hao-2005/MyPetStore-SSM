package org.csu.petstore.service;

import org.csu.petstore.vo.ItemVo;

import java.util.List;

public interface ItemService {
    public List<ItemVo> getItemsByIds(List<Integer> ids);
}
