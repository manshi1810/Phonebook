<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<%@ include file="component/allCss.jsp"%>
</head>
<body class="div-cus">
	<%@ include file="component/navBar.jsp"%>
	<div class="container-fluid div-custom p-5">
		<div class="row   p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4 >Registration</h4>
					</div>


					<%
					String successMsg = (String) session.getAttribute("successMsg");
					String errorMsg = (String) session.getAttribute("errorMsg");

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
					session.removeAttribute("errorMsg");
					}
					%>

					<div class="card-body m-3">
						<form action="register" method="post">
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
								<label for="exampleInputPassword1"><b>Password</b></label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1" required>
							</div>
							<div class="text-center m-2">
								<button type="submit" class="btn bg-custom text-light">Register</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="mt-3">
		<%@ include file="component/footer.jsp"%>
	</div>
</body>
</html>