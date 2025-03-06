package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName("lineitem")
public class LineItem {
    @TableField(value = "orderid")
    private String orderId;
    @TableField(value = "linenum")
    private int lineNum;
    @TableField(value = "itemid")
    private String itemId;
    private int quantity;
    @TableField(value = "unitprice")
    private BigDecimal unitPrice;

}
