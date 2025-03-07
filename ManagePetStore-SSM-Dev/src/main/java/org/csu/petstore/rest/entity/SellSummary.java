package org.csu.petstore.rest.entity;

public class SellSummary {
    private String itemId;
    private String productName;
    private int totalAmount;
    private double totalSales;
    private String month;

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productId) {
        this.productName = productId;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public double getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(double totalSales) {
        this.totalSales = totalSales;
    }

    public String getMonth() {return month;}

    public void setMonth(String month) {this.month = month;}
}
