package com.user.servlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.DAO.cartDAOImpl;
import com.DB.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/remove_book")
public class removeBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		cartDAOImpl dao = new cartDAOImpl(DBconnect.getConn());
		boolean flag = dao.removeBooks(id,uid,cid);
		
		jakarta.servlet.http.HttpSession session = req.getSession();
		
		if(flag) {
			session.setAttribute("succMsg", "Book deleted successfully");
			resp.sendRedirect("new_allBooks.jsp");
		}else {
			session.setAttribute("failedMsg", "Something went wrong");
			resp.sendRedirect("new_allBooks.jsp");
		}
	}
	
}
