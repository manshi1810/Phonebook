<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  page import="com.dao.ContactDAO"%>
<%@  page import="com.conn.DbConnect"%>
<%@  page import="java.util.List"%>
<%@  page import="com.entity.Contact"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Contacts</title>
<%@ include file="component/allCss.jsp"%>

</head>
<body >
	<%@ include file="component/navBar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Login Please");
		response.sendRedirect("login.jsp");
	}
	%>

	<%
	String successMsg = (String) session.getAttribute("successMsg");
	String errorMsg = (String) session.getAttribute("failedMsg");
	if (successMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=successMsg%></div>

	<%
	session.removeAttribute("successMsg");
	}
	
	if (errorMsg != null) {
	%>
	<p class="text-danger text-center"><%=errorMsg%></p>
	<%
	session.removeAttribute("failedMsg");
	}
	
	%>
	

	<div class="container-fluid div-cus  div-custom" >
		<div class="row p-1">


			<%
			if (user != null) {
				ContactDAO dao = new ContactDAO(DbConnect.getConn());
				List<Contact> contact = dao.getAllContact(user.getId());
				

				for (Contact c : contact) {
			%>
			<div class="col-md-3 ">
				<div class="card m-1">
					<div class="card-body">
						<h5>
							<b>Name :
							<%=c.getName()%></b>
						</h5>
						<p>
							<b>Phone No. :</b>
							<%=c.getPhno()%>
						</p>
						<p>
							<b>Email :</b>
							<%=c.getEmail()%>
						</p>
						<p>
							<b>Address :</b>
							<%=c.getAddress()%>
						</p>
						<div class="text-center">
							<a href="editContact.jsp?cid=<%=c.getId()%>"
								class="btn btn-primary btn-sm text-white">Edit</a> <a
								href="delete?cid=<%=c.getId()%>"
								class="btn btn-secondary btn-sm text-white">Delete</a>
						</div>
					</div>
				</div>
			</div>

			<%
			}

			}
			%>

		</div>

	</div>
	<div >
	<%@ include file="component/footer.jsp"%>
	</div>
</body>
</html>