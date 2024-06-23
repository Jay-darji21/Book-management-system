package com.user.servlet;

import java.util.regex.*;
import java.io.IOException;

import com.DB.DBconnect;
import com.entity.User;
import com.DAO.userDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Get the user data from frontend
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			// Set that data in user class
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phno);
			user.setPassword(password);

			jakarta.servlet.http.HttpSession session = req.getSession();

			if (phno.length() != 10) {
				session.setAttribute("failedMsg", "Invalid phone number");
				resp.sendRedirect("register.jsp");
			} else if (!validPassword(password)) {
				session.setAttribute("failedMsg", "Invalid password , Please follow the valid structure of password");
				resp.sendRedirect("register.jsp");
			} else if (check != null) {
				// Store data in database
				userDAOImpl usDAO = new userDAOImpl(DBconnect.getConn());
				
				boolean flag2 = usDAO.checkUser(email);

				if (flag2) {
					boolean flag = usDAO.Register(user);
					if (flag) {
						session.setAttribute("succMsg", "Registered Successfully...");
						resp.sendRedirect("register.jsp");
					} else {
						session.setAttribute("failedMsg", "Something went wrong, please try again later");
						resp.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("failedMsg", "User already exist");
					resp.sendRedirect("register.jsp");
				}

			} else {
				session.setAttribute("failedMsg", "Please agree to terms & conditions");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static boolean validPassword(String password) {
		// Check for minimum length of 8 characters
		if (password.length() < 8) {
			return false;
		}

		// Check for at least one uppercase letter
		Pattern uppercasePattern = Pattern.compile("[A-Z]");
		Matcher uppercaseMatcher = uppercasePattern.matcher(password);
		if (!uppercaseMatcher.find()) {
			return false;
		}

		// Check for at least one number
		Pattern numberPattern = Pattern.compile("[0-9]");
		Matcher numberMatcher = numberPattern.matcher(password);
		if (!numberMatcher.find()) {
			return false;
		}

		// Check for at least one special character
		Pattern specialCharPattern = Pattern.compile("[!@#$%^&*(),.?\":{}|<>]");
		Matcher specialCharMatcher = specialCharPattern.matcher(password);
		if (!specialCharMatcher.find()) {
			return false;
		}

		// If all conditions are met
		return true;
	}
}
