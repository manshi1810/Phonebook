<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@ include file="component/allCss.jsp"%>
</head>
<body class="div-cus">
	<%@ include file="component/navBar.jsp"%>
	<div class="container-fluid div-custom p-5 ">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">

					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>

					<%
					String invalidMsg = (String) session.getAttribute("invalidMsg");
					if (invalidMsg != null) {
					%>
					<p class="text-danger text-center"><%=invalidMsg%></p>
					<%
					session.removeAttribute("invalidMsg");
					}
					%>

					<%
					String logMsg = (String) session.getAttribute("logMsg");
					if (logMsg != null) {
					%>
					<p class="text-success text-center"><%=logMsg%></p>
					<%
					session.removeAttribute("logMsg");
					}
					%>
					<div class="card-body m-3">
						<form action="login" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1"><b>Email address</b></label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1"><b>Password</b></label> <input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" required>
							</div>
							<div class="text-center m-4">
								<button type="submit"
									class="btn bg-custom text-light btn-lg mt-4">Login</button>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-5">
		<%@ include file="component/footer.jsp"%>
	</div>
</body>
</html>