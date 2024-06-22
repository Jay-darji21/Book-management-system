package com.user.servlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.DAO.userDAOImpl;
import com.DB.DBconnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class loginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			userDAOImpl dao = new userDAOImpl(DBconnect.getConn());
			jakarta.servlet.http.HttpSession session = req.getSession();
			
			if("admin@gmail.com".equals(email) && "Admin@123".equals(password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("Admin/home.jsp");
			}else {
				
				User user = dao.login(email, password);
				if(user!=null) {
					session.setAttribute("userobj", user);
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failedMsg", "Invalid email or password");
					resp.sendRedirect("login.jsp");
					
				}
				
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
