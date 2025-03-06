package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.LineItem;
import org.csu.petstore.persistence.LineItemMapper;
import org.csu.petstore.service.LineItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("lineItemService")
public class LineItemServiceImpl implements LineItemService {
    @Autowired
    private LineItemMapper lineItemMapper;

    @Override
    public List<LineItem> getLineItemsById(Integer orderId) {
        QueryWrapper<LineItem> wrapper = new QueryWrapper<>();
        wrapper.eq("orderid", orderId);
        List<LineItem> list = lineItemMapper.selectList(wrapper);
        return list;
    }
}
