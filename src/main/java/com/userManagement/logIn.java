package com.userManagement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.SessionCookieConfig;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class logIn extends HttpServlet {
	static final Logger logger = (Logger) LoggerFactory.getLogger(logIn.class);
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uname=req.getParameter("uname");
        String password=req.getParameter("pass");

        LoginBean bean =new LoginBean();
		bean.setUname(uname);
		bean.setPassword(password);

		HttpSession session = req.getSession();
		session.setAttribute("name",uname);


		req.setAttribute("user", bean);
		RequestDispatcher rd;
		if(bean.validate()) {
			rd = req.getRequestDispatcher("loginSuccess.jsp");
			logger.info("Login Successful");
		}
		else {
			rd = req.getRequestDispatcher("loginFailed.jsp");
		}
		rd.forward(req, resp);

    }
}
