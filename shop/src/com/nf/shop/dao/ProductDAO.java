package com.nf.shop.dao;

import com.nf.shop.entity.Product;
import com.nf.shop.entity.TypeList;

import java.util.List;

public interface ProductDAO {

    //首页查询全部商品
    List<Product> getAll();

    //根据类型查询商品信息
    List<Product> getTypeProduct(int type);

    //根据Id查询商品信息
    Product getProductById(int pId);

    //根据条件查询商品信息（搜索框）
    List<Product> getProductsCondition(String value);

    //下架商品
    boolean lowerFrame(int pId);

    //上架商品
    boolean upperShelf(Product p);

    //修改商品信息
    boolean update(Product p);

}
