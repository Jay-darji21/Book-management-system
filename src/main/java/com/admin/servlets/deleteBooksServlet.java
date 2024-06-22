package com.admin.servlets;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.DAO.booksImpl;
import com.DB.DBconnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class deleteBooksServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			
			booksImpl dao = new booksImpl(DBconnect.getConn());
			boolean flag = dao.deleteBook(id);
			
			jakarta.servlet.http.HttpSession session = req.getSession();
			
			if(flag) {
				session.setAttribute("succMsg", "Book deleted successfully");
				resp.sendRedirect("Admin/all_book.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("Admin/all_book.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
