package com.user.servlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.DAO.userDAOImpl;
import com.DB.DBconnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edit_profile")
@MultipartConfig
public class editProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("uid"));
			String name = req.getParameter("Name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phone");
			String password = req.getParameter("password");
			
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			jakarta.servlet.http.HttpSession session = req.getSession();
			
			userDAOImpl dao = new userDAOImpl(DBconnect.getConn());
		
			if(dao.checkPassword(id, password)) {
				boolean flag = dao.updateProfile(us);
				if(flag) {
					session.setAttribute("succMsg", "Profile updated successfully!!");
					resp.sendRedirect("settings.jsp");
				}else {
					session.setAttribute("failedMsg", "Something went wrong!!");
					resp.sendRedirect("settings.jsp");
				}	
				
			}else {
				session.setAttribute("wrongPassword", "Incorrect password!!");
				resp.sendRedirect("edit_profile.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
