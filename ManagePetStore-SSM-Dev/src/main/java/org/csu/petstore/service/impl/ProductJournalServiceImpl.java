package org.csu.petstore.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.csu.petstore.entity.ProductJournal;
import org.csu.petstore.persistence.ProductJournalMapper;
import org.csu.petstore.service.ProductJournalService;
import org.csu.petstore.vo.ProductJournalVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service("productJournalService")
public class ProductJournalServiceImpl implements ProductJournalService {
    @Autowired
    ProductJournalMapper productJournalMapper;

    //检测商品是否已经有被记录
    private int isProductInResult(ProductJournal productJournal,List<ProductJournalVo> result) {
        int i;
        for(i=0;i<result.size();i++){
            if(Objects.equals(productJournal.getProductId(), result.get(i).getProductId())){
                return i;
            }
        }
        return -1;
    }

    //根据浏览次数快排
    private void QuickSortByViewTime(List<ProductJournalVo> arr, int left, int right) {
        if (left >= right) {
            return;
        }

        ProductJournalVo base = arr.get(left);
        int i = left;
        int j = right;

        while (i != j) {
            while (arr.get(j).getViewCount() <= base.getViewCount() && i < j) {
                j--;
            }
            while (arr.get(i).getViewCount() >= base.getViewCount() && i < j) {
                i++;
            }
            if (i < j) {
                ProductJournalVo temp = arr.get(i);
                arr.set(i, arr.get(j));
                arr.set(j, temp);
            }
        }

        arr.set(left, arr.get(i));
        arr.set(i, base);

        QuickSortByViewTime(arr, left, i - 1);
        QuickSortByViewTime(arr, i + 1, right);
    }


    @Override
    public List<ProductJournalVo> getViewTimeByUserId(String userId) {
        //search
        QueryWrapper<ProductJournal> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userId", userId);
        List<ProductJournal> list = productJournalMapper.selectList(queryWrapper);

        List<ProductJournalVo> result = new ArrayList<>();
        //count
        for(int i=0;i<list.size();i++){
            ProductJournal productJournal = list.get(i);
            int flag = isProductInResult(productJournal,result);

            //check is exist and count
            if(flag==-1){
                //not exist   new vo append to result list
                ProductJournalVo productJournalVo = new ProductJournalVo();
                productJournalVo.setProductId(productJournal.getProductId());
                productJournalVo.setUserId(productJournal.getUserId());
                productJournalVo.setViewCount(1);
                result.add(productJournalVo);
            }else{
                //exist count+1
                ProductJournalVo productJournalVo = result.get(flag);
                productJournalVo.setViewCount(productJournalVo.getViewCount()+1);
                result.set(flag,productJournalVo);
            }
        }
        return result;
    }

    @Override
    public List<ProductJournalVo> getThreeMostViewProducts(String userId) {
        List<ProductJournalVo> result = getViewTimeByUserId(userId);

        //size<=3
        if(result.size()<=3){
            return result;
        }

        //sort
        QuickSortByViewTime(result,0,result.size()-1);

        //size->3
        while (result.size()>3){
            result.removeLast();
        }

        return result;
    }

}

