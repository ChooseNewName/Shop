package com.nf.shop.dao;

import com.nf.shop.entity.User;

import java.util.List;

public class UserInMemoryDAO implements UserDAO {

    String sql = null;

    @Override
    public List<User> getAllUser() {
        return null;
    }

    @Override
    public List<User> checkLogin(String str, String password) {
        //sql语句
        sql = "select * from userInfo where " +
                "userName=? or email=? or phoneNumber=? and password=?";
        return JDBCUtil.preparedQuery(User.class, sql, str, str, str, password);
    }

    @Override
    public User getUserById(int id) {
        return null;
    }

    @Override
    public int adduser(User user) {
        //sql语句
        sql= "insert into userInfo(userName,password,phoneNumber,email) values (?,?,?,?);";

        return JDBCUtil.preparedUpdate(sql,user.getUserName(),user.getPassword(),user.getPhoneNumber(),user.getEmail());
    }
}
