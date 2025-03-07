package org.csu.petstore.service;

import org.csu.petstore.vo.ProductJournalVo;

import java.util.List;

public interface ProductJournalService {
    public List<ProductJournalVo> getViewTimeByUserId(String userId);   //获得用户每个商品的浏览次数
    public List<ProductJournalVo> getThreeMostViewProducts(String userId);  //获得浏览最多的三个商品
}
