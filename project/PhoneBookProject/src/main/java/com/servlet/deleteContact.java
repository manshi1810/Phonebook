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

@WebServlet("/delete")
public class deleteContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int cid = Integer.parseInt(request.getParameter("cid"));

		ContactDAO dao = new ContactDAO(DbConnect.getConn());

		HttpSession session = request.getSession();
		boolean f = dao.deleteContactById(cid);
		if (f) {
			session.setAttribute("successMsg", "Contact Deleted Successfully");
			response.sendRedirect("viewContact.jsp");
		} else {
			session.setAttribute("failedMsg", "Contact not deleted");
			response.sendRedirect("viewContact.jsp");
		}
	}
}
