package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.DAO.bookOrderImpl;
import com.DAO.cartDAOImpl;
import com.DB.DBconnect;
import com.entity.Cart;
import com.entity.orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orders")
@MultipartConfig
public class orderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String landmark = req.getParameter("landmark");
			String pin = req.getParameter("pincode");
			String payment_mode = req.getParameter("payment");
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			String full_address = address+","+landmark+","+city+","+state+","+pin;
			
			cartDAOImpl dao = new cartDAOImpl(DBconnect.getConn());
			List<Cart> list = dao.getUserBooks(uid);
			
			bookOrderImpl dao2 = new bookOrderImpl(DBconnect.getConn());
			int i = dao2.getOrderNumber();
			
			orders o;
			
			ArrayList<orders> orderList = new ArrayList<>();
			
			for(Cart c : list) {
				o = new orders();
				o.setOrderId("BOOK-ORD-00"+i);
				o.setUserName(name);
				o.setEmail(email);
				o.setPhone(phno);
				o.setAddress(full_address);
				o.setBook_name(c.getBookName());
				o.setAuthor(c.getAuthorName());
				o.setPrice(c.getPrice()+"");
				o.setPayment(payment_mode);
				i++;
				orderList.add(o);
			}
			
			boolean flag = dao2.saveOrder(orderList);
			jakarta.servlet.http.HttpSession session = req.getSession();
			
			if(flag) {
				cartDAOImpl dao3 = new cartDAOImpl(DBconnect.getConn());
				dao3.deletBook(uid);
				
				session.setAttribute("succMsg", "Your Order placed successfully!!!");
				resp.sendRedirect("order_success.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wend wrong!!");
				resp.sendRedirect("index.jsp");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	

}
