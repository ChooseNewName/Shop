package com.nf.shop.web;

import com.google.gson.Gson;
import com.nf.shop.dao.TypeListDAO;
import com.nf.shop.dao.TypeListInMemoryDAO;
import com.nf.shop.entity.TypeList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/ShowTypeListServlet"})
public class ShowTypeListServlet extends HttpServlet {

    TypeListDAO tyIMdao = new TypeListInMemoryDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<TypeList> lists =null;

        Gson gson = new Gson();

        PrintWriter out = resp.getWriter();

        lists = tyIMdao.getAllType();

        out.write(gson.toJson(lists));

        out.close();

    }
}
