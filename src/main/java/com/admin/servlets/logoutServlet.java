package com.admin.servlets;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class logoutServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			jakarta.servlet.http.HttpSession session = req.getSession();
			session.removeAttribute("userobj");
			
			jakarta.servlet.http.HttpSession session2 = req.getSession();
			session2.setAttribute("succMsg", "Logout successfully..");
			resp.sendRedirect("login.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
