package org.csu.petstore.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("productjournal")
public class ProductJournal {
    @TableId(value = "userId")
    private String userId;
    @TableField("productId")
    private String productId;
}
