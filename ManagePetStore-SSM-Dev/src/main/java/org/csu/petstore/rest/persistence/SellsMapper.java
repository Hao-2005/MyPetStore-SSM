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
    //返回指定时间段内的订单信息
    List<SellSummary> getSellSummariesBetweenDates(
             String startDate,  String endDate);
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
            GROUP BY sells.item_id
            ORDER BY total_amount DESC, total_sales DESC
            LIMIT #{num}
        """)
    @Results({
            @Result(property = "itemId", column = "item_id"),
            @Result(property = "productName", column = "product_name"),
            @Result(property = "totalAmount", column = "total_amount"),
            @Result(property = "totalSales", column = "total_sales")
    })
    //返回历史前amount个畅销Item
    List<SellSummary> getHistoricalPopularItem(
            int num);

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
            GROUP BY sells.item_id
            ORDER BY total_amount DESC, total_sales DESC
        """)
    @Results({
            @Result(property = "itemId", column = "item_id"),
            @Result(property = "productName", column = "product_name"),
            @Result(property = "totalAmount", column = "total_amount"),
            @Result(property = "totalSales", column = "total_sales")
    })
        //返回指定时间段畅销Item
    List<SellSummary> getPopularItemBetweenDates(
            String startDate,  String endDate);

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
            GROUP BY sells.item_id
            ORDER BY total_sales DESC
            LIMIT #{num}
        """)
    @Results({
            @Result(property = "itemId", column = "item_id"),
            @Result(property = "productName", column = "product_name"),
            @Result(property = "totalAmount", column = "total_amount"),
            @Result(property = "totalSales", column = "total_sales")
    })
        //返回历史前amount个销售额最高Item
    List<SellSummary> getHistoricalProfitableItem(
            int num);
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
            GROUP BY sells.item_id
            ORDER BY total_sales DESC
        """)
    @Results({
            @Result(property = "itemId", column = "item_id"),
            @Result(property = "productName", column = "product_name"),
            @Result(property = "totalAmount", column = "total_amount"),
            @Result(property = "totalSales", column = "total_sales")
    })
        //返回指定时间段销售额最高Item
    List<SellSummary> getProfitableItemBetweenDates(
            String startDate,  String endDate);
    @Select("""
        SELECT
            DATE_FORMAT(sells.time, '%Y-%m') AS month,
            SUM(amount * listprice) AS total_sales
        FROM
            sells
                JOIN item ON sells.item_id = item.itemid
                JOIN product ON item.productid=product.productid
        WHERE
            YEAR(sells.time) = #{year}
        GROUP BY DATE_FORMAT(sells.time, '%Y-%m')
        ORDER BY month
    """)
    @Results({
            @Result(property = "month", column = "month"),
            @Result(property = "totalSales", column = "total_sales")
    })
// 返回指定年份每个月的销售额
    List<SellSummary> getMonthlySalesByYear(
            int year);
}
