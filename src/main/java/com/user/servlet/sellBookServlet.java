package com.user.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.booksImpl;
import com.DB.DBconnect;
import com.entity.bookDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@WebServlet("/old_book")
@MultipartConfig
public class sellBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("bookName");
			String authorName = req.getParameter("authorName");
			String price = req.getParameter("price");
			String category = req.getParameter("category");
			String status = "Active";
			Part part = req.getPart("photo");
			String fileName = part.getSubmittedFileName();
			String email = req.getParameter("email2");
			
			// Create a object of class bookDtls
			
			bookDtls b = new bookDtls(bookName,authorName,price,category,status,fileName,email);
			
			jakarta.servlet.http.HttpSession session = req.getSession();
			booksImpl dao = new booksImpl(DBconnect.getConn());
			boolean flag = dao.addBook(b);
			if(flag) {
				// Add photo books in books folder
				
				String path = getServletContext().getRealPath("")+"books";
				
				File f = new File(path);
				part.write(path+File.separator+fileName);
				
				// Show the message on front end
				session.setAttribute("succMsg", "Book added successfully");
				resp.sendRedirect("settings.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something wend wrong, please try again!!");
				resp.sendRedirect("settings.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	

}
