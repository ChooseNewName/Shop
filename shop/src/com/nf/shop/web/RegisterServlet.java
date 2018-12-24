package com.nf.shop.web;

import com.nf.shop.dao.UserDAO;
import com.nf.shop.dao.UserInMemoryDAO;
import com.nf.shop.entity.User;
import com.sun.net.httpserver.HttpsServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    UserDAO userIMDAO= new UserInMemoryDAO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //获取表单的信息
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        String phoneNumber = req.getParameter("phoneNumber");
        String email = req.getParameter("email");

        //把信息存到一个对象里面
        User user = new User(userName,password,phoneNumber,email);
        System.out.println(user);
        int sum= userIMDAO.adduser(user);
        System.out.println(sum);
        PrintWriter out = resp.getWriter();

        if (sum>0){
            out.write(sum);
        }else{
            out.write(sum);
        }

        out.close();
    }
}
