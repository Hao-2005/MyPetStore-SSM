package org.csu.petstore.rest.persistence;

import org.apache.ibatis.annotations.*;
import org.csu.petstore.rest.entity.SellSummary;

import java.util.List;

@Mapper
public interface SellsMapper {
    @Select("""
          SELECT
              sells.item_id,
              product.name as product_name,
              SUM(amount) AS total_amount,
              SUM(amount * listprice) AS total_sales
          FROM
              sells
                  JOIN item ON sells.item_id = item.itemid
                  JOIN product ON item.productid=product.productid
          WHERE
              time BETWEEN #{startDate} AND #{endDate}
          GROUP BY sells.item_id""")
    @Results({
            @Result(property = "itemId", column = "item_id"),
            @Result(property = "productName", column = "product_name"),
            @Result(property = "totalAmount", column = "total_amount"),
            @Result(property = "totalSales", column = "total_sales")
    })
    List<SellSummary> getSellSummariesBetweenDates(
             String startDate,  String endDate);

}
