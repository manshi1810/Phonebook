<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.dao.ContactDAO"%>
<%@  page import="com.conn.DbConnect"%>
<%@  page import="java.util.List"%>
<%@  page import="com.entity.Contact"%>
<%@ page import="com.entity.User"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Contact</title>
<%@ include file="component/allCss.jsp"%>
</head>
<body class="div-custom">
	<%@ include file="component/navBar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Login Plase..");
		response.sendRedirect("login.jsp");
	}
	%>
	<%
	Integer c_id = Integer.parseInt(request.getParameter("cid"));
	ContactDAO dao = new ContactDAO(DbConnect.getConn());
	Contact c = dao.getContactById(c_id);
	%>
	<div class="container-fluid div-cus">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card ">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4 class="text-center text-light">Update Contact</h4>
					</div>
					<div class="card-body">

						<%
						String errorMsg = (String) session.getAttribute("failedMsg");
						String successMsg = (String) session.getAttribute("successMsg");

						if (successMsg != null) {
						%>
						<p class="text-success text-center"><%=successMsg%></p>
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

						<form action="updateContact" method="post">

							<input type="hidden" value="<%=c_id%>" name="cid">
							<div class="form-group">
								<label for="exampleInputName1"><b>Enter Name</b></label> <input
									value="<%=c.getName()%>" type="text" name="name"
									class="form-control" id="exampleInputName"
									aria-describedby="NameHelp">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1"><b>Email address</b></label> <input
									value="<%=c.getEmail()%>" type="email" name="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">

							</div>

							<div class="form-group">
								<label for="exampleInputPhone"><b>Enter Phone Number</b></label>
								<input value="<%=c.getPhno()%>" type="number" name="phno"
									class="form-control" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<b>Address</b>
								<textarea rows="3" cols="55" class="form-control" name="address"
									placeholder="Enter Address "><%=c.getAddress()%></textarea>
							</div>
							<div class="text-center m-2">
								<button type="submit" class="btn bg-custom text-white">Update
									</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="component/footer.jsp"%>

</body>
</html>