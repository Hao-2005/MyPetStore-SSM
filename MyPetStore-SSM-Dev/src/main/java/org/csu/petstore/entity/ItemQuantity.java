package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@TableName("inventory")
@Data
@Getter
@Setter
public class ItemQuantity
{
    @TableId(value = "itemid")
    private String itemId;
    @TableField("qty")
    private Integer quantity;
}
