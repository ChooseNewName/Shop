package com.nf.shop.web;

import com.nf.shop.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
//注销
@WebServlet(urlPatterns = {"/CancellationServlet"})
public class CancellationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        session.setAttribute("User", null);
        PrintWriter out = resp.getWriter();
        User user = (User) session.getAttribute("User");

        if (user == null) {
            out.write(1);
        }
        out.close();
    }
}
