package org.csu.petstore.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.csu.petstore.entity.Product;

import java.util.List;

@Data
@Setter
@Getter
public class CategoryVO
{
    private String categoryId;
    private String categoryName;
    private List<Product> productList;
}
