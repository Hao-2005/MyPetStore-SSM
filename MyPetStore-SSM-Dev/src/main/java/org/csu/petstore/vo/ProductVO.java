package org.csu.petstore.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.csu.petstore.entity.Item;

import java.util.List;

@Data
@Setter
@Getter
public class ProductVO
{
    private String productId;
    private String categoryId;
    private String productName;
    private String description;

    private List<Item> itemList;
}
