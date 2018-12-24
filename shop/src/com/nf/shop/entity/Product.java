package com.nf.shop.entity;

import java.math.BigDecimal;
//商品实体类
public class Product {

    private int pId;               //商品id
    private String pName;         //商品名称
    private String pDetails;    //介绍
    private BigDecimal price;    //价格
    private String pPicture;    //图片路径
    private boolean pState;     //商品状态
    private int pType;            //类型
    private String type;            //类型名称

    public Product() {
    }

    public Product(int pId, String pName, String pDetails, BigDecimal price, String pPicture, boolean pState, int pType, String type) {
        this.pId = pId;
        this.pName = pName;
        this.pDetails = pDetails;
        this.price = price;
        this.pPicture = pPicture;
        this.pState = pState;
        this.pType = pType;
        this.type = type;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDetails() {
        return pDetails;
    }

    public void setpDetails(String pDetails) {
        this.pDetails = pDetails;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getpPicture() {
        return pPicture;
    }

    public void setpPicture(String pPicture) {
        this.pPicture = pPicture;
    }

    public boolean ispState() {
        return pState;
    }

    public void setpState(boolean pState) {
        this.pState = pState;
    }

    public int getpType() {
        return pType;
    }

    public void setpType(int pType) {
        this.pType = pType;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}