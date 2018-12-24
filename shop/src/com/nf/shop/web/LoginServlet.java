package com.nf.shop.web;

import com.nf.shop.dao.UserDAO;
import com.nf.shop.dao.UserInMemoryDAO;
import com.nf.shop.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    //连接数据库
    UserDAO userDAO = new UserInMemoryDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //获取一个seesion对象,同时查看其作用域中没有user对象
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        //获取一个输出流对象
        PrintWriter out = resp.getWriter();
        //登录返回信息
        String msg = "";
        //判断user对象是否为空
        if (user == null) {
            //获取请求中的数据
            String account = req.getParameter("account");
            String password = req.getParameter("password");

            //调用查询语句,判断账号密码
            List<User> checkuser = userDAO.checkLogin(account, password);
            if (checkuser.size()>0) {
                user = checkuser.get(0);
                session.setAttribute("User", user);
                msg = "1";
                out.write(msg);
            } else {
                msg = "0";
                out.write(msg);
            }
        } else {
            msg = "你已登录，请勿重新登录";
            out.write(msg);

        }

        out.close();
    }
}
