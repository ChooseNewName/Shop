package com.nf.shop.dao;

import com.nf.shop.entity.TypeList;

import javax.sql.rowset.JdbcRowSet;
import java.lang.reflect.Type;
import java.util.List;


public class TypeListInMemoryDAO implements TypeListDAO {

    String sql = null;
    @Override
    public List<TypeList> getAllType() {
        //sql语句
        sql = "select * from productType";
        return JDBCUtil.preparedQuery(TypeList.class,sql);
    }


}
