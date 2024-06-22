package com.user.servlet;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.DAO.booksImpl;
import com.DAO.cartDAOImpl;
import com.DB.DBconnect;
import com.entity.Cart;
import com.entity.bookDtls;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cart")
public class cartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			booksImpl dao = new booksImpl(DBconnect.getConn());
			bookDtls b = dao.getBookById(bid);
			
			Cart c = new Cart();
			c.setBookId(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthorName(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal_price(Double.parseDouble(b.getPrice()));
			
			cartDAOImpl cdao = new cartDAOImpl(DBconnect.getConn());
			boolean flag = cdao.addCart(c);
			
			jakarta.servlet.http.HttpSession session = req.getSession();
		
			if(flag) {
				session.setAttribute("addCart", "Book is added to cart!!");
				resp.sendRedirect("new_allBooks.jsp");
			}else {
				session.setAttribute("failedMsg", "Something went wrong!!");
				resp.sendRedirect("new_allBooks.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
