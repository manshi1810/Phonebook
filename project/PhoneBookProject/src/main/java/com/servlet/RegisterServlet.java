package com.servlet;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User u = new User(name, email, password);
		
		UserDAO dao = new UserDAO(DbConnect.getConn());
		boolean f = dao.userRegister(u);
		
		HttpSession session = request.getSession();
		
		if (f) {
			//System.out.println("User Registerd Successfully");
			session.setAttribute("successMsg", "User Registerd Successfully");
			response.sendRedirect("login.jsp");
			

		} else {
			//System.out.println("somthing wrong on server");
			session.setAttribute("errorMsg", "User Not registerd");
			response.sendRedirect("register.jsp");
			
		}
	}
}