package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println(email+ " " +password);
		UserDAO dao = new UserDAO(DbConnect.getConn());
		User u = dao.loginUser(email,password);
		
		
		HttpSession session = request.getSession();
		
		if (u != null) {
			System.out.println("User is Available = "+u);
			session.setAttribute("user", u);
			response.sendRedirect("index.jsp");
			

		} else {
			System.out.println("User is not Available = "+u);
			session.setAttribute("invalidMsg", "invalid Email & password");
			response.sendRedirect("login.jsp");
			
		}
		
		
	}

}
