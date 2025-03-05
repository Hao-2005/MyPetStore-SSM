package org.csu.petstore.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Data
@Getter
@Setter
public class ItemVO
{
    private String itemId;

    private String productId;
    private String productName;
    private BigDecimal listPrice;

    private String attribute1;
    private String attribute2;
    private String attribute3;
    private String attribute4;
    private String attribute5;

    private Integer quantity;
}
