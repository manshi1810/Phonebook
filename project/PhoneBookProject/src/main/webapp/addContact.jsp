<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Contact Page</title>
<%@ include file="component/allCss.jsp"%>
</head>
<body class="div-custom">
	<%@ include file="component/navBar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Login Please..");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid div-cus">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card ">
				<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4 class="text-center text-light">Add Contact</h4>
					</div>
					<div class="card-body">
						

						<%
						String successMsg = (String) session.getAttribute("successMsg");
						String errorMsg = (String) session.getAttribute("failedMsg");

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

						<form action="addContact" method="post">
							<%
							if (user != null) {
							%>
							<input type="hidden" value="<%=user.getId()%>" name="userid">
							<%
							}
							%>

							<div class="form-group">
								<label for="exampleInputName1"><b>Enter Name</b></label> <input
									type="text" name="name" class="form-control"
									id="exampleInputName" aria-describedby="NameHelp" required>

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1"><b>Email address</b></label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>

							</div>

							<div class="form-group">
								<label for="exampleInputPhone"><b>Phone Number</b></label> <input
									type="number" name="phno" class="form-control"
									id="exampleInputPassword1" required>
							</div>
							<div class="form-group">
								<b>Address</b><textarea rows="2" cols="55" class="form-control" name="address"></textarea>

								<div class="text-center mt-1">
									<button type="submit" class="btn bg-custom text-white mt-3">Add
										Contact</button>
								</div>

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