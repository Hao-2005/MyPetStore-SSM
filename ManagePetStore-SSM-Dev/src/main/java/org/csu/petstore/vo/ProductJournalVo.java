package org.csu.petstore.vo;

import lombok.Data;

@Data
public class ProductJournalVo {
    private String userId;
    private String productId;
    private int viewCount;

    public ProductJournalVo() {
        super();
        viewCount = 0;
    }
}
