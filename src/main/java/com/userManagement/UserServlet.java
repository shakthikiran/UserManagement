package com.userManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String action = req.getParameter("action");
		UserDAO operation=new UserDAO();
		int id;
		String name,email,country;
		switch (action){
			case "add":
				name=req.getParameter("name");
				email=req.getParameter("email");
				country=req.getParameter("country");
				User userAdd = new User(name,email,country);
				operation.addUser(userAdd);
				break;
			case "update":
				id= Integer.parseInt(req.getParameter("id"));
				name=req.getParameter("updateName");
				email=req.getParameter("updateEmail");
				country=req.getParameter("updateCountry");
				User userUpdate = new User(id,name,email,country);
                try {
                    operation.updateUser(userUpdate);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
			case "delete":
				id= Integer.parseInt(req.getParameter("id"));
                try {
                    operation.deleteUser(id);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
				break;
			default:
				break;
		}
		resp.sendRedirect("loginSuccess.jsp");
	}
}
