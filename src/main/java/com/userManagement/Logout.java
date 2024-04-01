package com.userManagement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Logout extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session= req.getSession(false);
        session.removeAttribute("name");
        //session.invalidate();
        res.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        res.sendRedirect("login.jsp");
    }
}
