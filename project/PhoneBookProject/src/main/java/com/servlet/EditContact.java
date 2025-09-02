package com.servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;

@WebServlet("/updateContact")
public class EditContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int cid = Integer.parseInt(request.getParameter("cid"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phno = request.getParameter("phno");
		String address = request.getParameter("address");

		ContactDAO dao = new ContactDAO(DbConnect.getConn());

		HttpSession session = request.getSession();
		boolean f = dao.updateContact(cid, name, email, phno, address);
		
		if (f) {
			System.out.println("data updated successfully");
			session.setAttribute("successMsg", "Your Contact Updated");
			response.sendRedirect("viewContact.jsp");
		} else {
			session.setAttribute("failedMsg", "Your Contact notupdated");
			response.sendRedirect("editContact.jsp?cid=" + cid);
		}
	}

}
