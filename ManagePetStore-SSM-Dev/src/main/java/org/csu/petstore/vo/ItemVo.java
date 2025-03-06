package org.csu.petstore.vo;

import lombok.Data;
import org.csu.petstore.entity.Item;

import java.math.BigDecimal;

@Data
public class ItemVo {
    private String itemId;
    private String productId;
    private BigDecimal listPrice;
    private BigDecimal unitCost;
    private int supplierId;
    private String status;
    private String attribute1;
    private String attribute2;
    private String attribute3;
    private String attribute4;
    private String attribute5;
    private String productName;
    private int viewTime;   //商品浏览次数

    public ItemVo(){

    }
    public ItemVo(Item item){
        this.itemId = item.getItemId();
        this.productId = item.getProductId();
        this.listPrice = item.getListPrice();
        this.unitCost = item.getUnitCost();
        this.supplierId = item.getSupplierId();
        this.status = item.getStatus();
        this.attribute1 = item.getAttribute1();
        this.attribute2 = item.getAttribute2();
        this.attribute3 = item.getAttribute3();
        this.attribute4 = item.getAttribute4();
        this.attribute5 = item.getAttribute5();
        this.productName = null;
        this.viewTime = 0;
    }
}
