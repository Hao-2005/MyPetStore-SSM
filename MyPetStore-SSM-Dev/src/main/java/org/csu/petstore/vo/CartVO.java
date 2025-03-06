package org.csu.petstore.vo;

import org.csu.petstore.entity.Item;

import java.util.*;

public class CartVO {
    private final Map<String, Item> itemMap = Collections.synchronizedMap(new HashMap<String, Item>());
    private final List<Item> itemList = new ArrayList<Item>();
}
