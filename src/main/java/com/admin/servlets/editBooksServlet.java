package com.admin.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import com.DAO.booksImpl;
import com.DB.DBconnect;
import com.entity.bookDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edit_books")
public class editBooksServlet extends HttpServlet{
	private Connection connection = DBconnect.getConn();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		    int id = Integer.parseInt(req.getParameter("bookId"));
			String bname = req.getParameter("bookName");
			String bAuthor = req.getParameter("authorName");
			String price = req.getParameter("price");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			
			
			
		
		
			bookDtls b = new bookDtls();
			b.setBookId(id);
			b.setBookName(bname);
			b.setAuthor(bAuthor);
			b.setPrice(price);
			b.setCategory(category);
			b.setStatus(status);
			
			booksImpl dao = new booksImpl(DBconnect.getConn());
			boolean flag = dao.updateBookks(b);
			jakarta.servlet.http.HttpSession session = req.getSession();
//			session.setAttribute("succMsg", "Data updated successfully...");
//			resp.sendRedirect("Admin/all_book.jsp");
//			
			if(flag) {
				session.setAttribute("succMsg", "Book updated successfully...");
				resp.sendRedirect("Admin/all_book.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("Admin/all_book.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
