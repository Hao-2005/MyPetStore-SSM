package org.csu.petstore.service;

import org.csu.petstore.entity.LineItem;

import java.util.List;

public interface LineItemService {
    public List<LineItem> getLineItemsById(Integer orderId);
}
