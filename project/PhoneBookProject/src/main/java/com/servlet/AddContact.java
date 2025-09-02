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


@WebServlet("/addContact")
public class AddContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("userid"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phno = request.getParameter("phno");
		String address = request.getParameter("address");

		Contact c = new Contact(name,email,phno,address,userId);
		ContactDAO dao = new ContactDAO(DbConnect.getConn());
		
		HttpSession session = request.getSession();
		boolean f = dao.saveContact(c);
		if(f)
		{
			session.setAttribute("successMsg", "Your Contact Saved");
			response.sendRedirect("addContact.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Your Contact not Saved");
			response.sendRedirect("addContact.jsp");
		}
		
	}

}
