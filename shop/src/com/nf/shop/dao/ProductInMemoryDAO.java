package com.nf.shop.dao;

import com.nf.shop.entity.Product;
import com.nf.shop.entity.TypeList;

import java.util.List;

public class ProductInMemoryDAO implements ProductDAO {

    String sql = null;

    @Override
    public List<Product> getAll() {
        //sql语句
        sql = "select * from productInfo where pState=1";
        return  JDBCUtil.preparedQuery(Product.class,sql);
    }

    @Override
    public List<Product> getTypeProduct(int type) {
        //sql语句
        sql = "select * from productInfo where pState=1 and pType=?";
        return JDBCUtil.preparedQuery(Product.class,sql,type);
    }

    @Override
    public Product getProductById(int pId) {
        //sql语句
        sql ="select * from productInfo where pState=1 and pId=?";
        Product p = null;
        List<Product> list = JDBCUtil.preparedQuery(Product.class,sql,pId);
        for (Product product : list) {
             p = new Product();
        }
        return p;
    }

    @Override
    public List<Product> getProductsCondition(String value) {
        //sql语句
        sql = "select pName,PDetails,price,pPicture,`type` from" +
                " productInfo p join productType pt on" +
                " p.pType=pt.id where " +
                " pState=1 and pName like ? or pDetails like ? or `type` like ?";
        return JDBCUtil.preparedQuery(Product.class,sql,"%"+value+"%","%"+value+"%","%"+value+"%");

    }

    @Override
    public boolean lowerFrame(int pId) {
        sql = "update productInfo set pState=true where pId=?";
        int sum = JDBCUtil.preparedUpdate(sql);
        if (sum>0){
            return true;
        }else {
            return false;
        }

    }

    @Override
    public boolean upperShelf(Product p) {
        sql = "update productInfo set pState=false where pId=?";
        int sum = JDBCUtil.preparedUpdate(sql,p.getpType());
        if (sum>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean update(Product p) {
        return false;
    }
}
