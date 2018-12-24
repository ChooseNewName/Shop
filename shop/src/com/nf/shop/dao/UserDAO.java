package com.nf.shop.dao;
import com.nf.shop.entity.User;
import java.util.List;

//操作用户表接口
public interface UserDAO {

    //查询全部用户信息
    List<User> getAllUser();

    //登陆判断
    List<User> checkLogin (String str,String password);

    //根据id查询用户
    User getUserById(int id);

    int adduser(User user);


}
