package com.nf.shop.web;

import com.google.gson.Gson;
import com.nf.shop.dao.ProductInMemoryDAO;
import com.nf.shop.dao.ProductDAO;
import com.nf.shop.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(urlPatterns = {"/ShowProductServlet"})
public class ShowProductServlet extends HttpServlet {

    ProductDAO pIMDAO = new ProductInMemoryDAO();
    //返回的集合
    List<Product> list = null;
    //创建Gson对象
    Gson gson = new Gson();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //获取输出流对象
        PrintWriter out = resp.getWriter();

        //类型
        int type =Integer.parseInt(req.getParameter("type"));

        //接收jsp发送过来的查询请求,
        //调用查询的方法
        if (type==0){
            list = pIMDAO.getAll();
            out.write(gson.toJson(list));
        }else {
            list = pIMDAO.getTypeProduct(type);
            out.write(gson.toJson(list));

        }
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String valueA = req.getParameter("value");
        System.out.println(valueA);
        list = pIMDAO.getProductsCondition(valueA);
        PrintWriter out = resp.getWriter();
        out.write(gson.toJson(list));
        out.close();
    }
}
