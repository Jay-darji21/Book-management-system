package com.user.servlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.DAO.booksImpl;
import com.DB.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/remove_old_book")
@MultipartConfig
public class removeOldBookServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("bid"));
		
		booksImpl dao = new booksImpl(DBconnect.getConn());
		boolean flag = dao.deleteBook(id);
		
		jakarta.servlet.http.HttpSession session = req.getSession();
		
		if(flag) {
			session.setAttribute("succMsg", "Book removed successfully!!!");
			resp.sendRedirect("settings.jsp");
		}
		else {
			session.setAttribute("failedMsg", "Something wend wrong!!");
			resp.sendRedirect("settings.jsp");
		}
		
	}
	
}
