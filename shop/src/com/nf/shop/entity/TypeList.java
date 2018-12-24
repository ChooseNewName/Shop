package com.nf.shop.entity;
//类型列表实体类
public class TypeList {

    private int id;     //类型id
    private String type;   //类型名称

    public TypeList() {
    }

    public TypeList(int id, String type) {
        this.id = id;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String gettype() {
        return type;
    }

    public void settype(String type) {
        this.type = type;
    }
}
