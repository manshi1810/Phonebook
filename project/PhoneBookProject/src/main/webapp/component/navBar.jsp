<%@  page import="com.entity.User"%>

<nav
	class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom div-custom">
	<a class="navbar-brand" href="index.jsp"><i
		class="fa-solid fa-square-phone"></i> PhoneBook</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house-chimney"></i> Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="addContact.jsp"><i class="fa-solid fa-user-plus"></i> Add
					Contact</a></li>

			<li class="nav-item active"><a class="nav-link "
				href="viewContact.jsp"><i class="fa-solid fa-eye"></i> View
					Contacts</a></li>
		</ul>
		<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
		%>

		<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
			type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i>Login</a>

		<a href="register.jsp" class="btn btn-light my-2 my-sm-0"
			type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a>

		<%
		} else {
		%>

		<a href="" class="btn btn-light  my-2 my-sm-0 mr-2"
			data-toggle="modal" data-target="#exampleModal" type="submit"><i
			class="fa fa-user-circle-o" aria-hidden="true"></i><%=user.getName()%></a>

		<a href="" class="btn btn-light my-2 my-sm-0" data-toggle="modal"
			data-target="#exampleModalCenter" type="submit"><i
			class="fa fa-user-plus" aria-hidden="true"></i>Logout</a>

		<!-- Model for info -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content div-cus">
					<div class="modal-header">
						<h5 class="modal-title text-center" id="exampleModalLabel">
							<b>User Detailes</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container text-center">
							<i class="fa fa-user fa-3x"></i>
							<h5></h5>
							<table class="table">
								<tbody>
									<tr>
										<th>User ID</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th>Full Name</th>
										<td><%=user.getName()%></td>
									</tr>
									<tr>
										<th>Email Id</th>
										<td><%=user.getEmail()%></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>

		<%
		}
		%>

	</div>

	<!-- logout pop-up -->
	<!-- model -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content div-cus">
				<div class="modal-header ">
					<h5 class="modal-title text-center" id="exampleModalLongTitle">Logout</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ">
					<div class="container text-center">
						<i class="fa fa-user-plus fa-3x"></i>
						<h5 class="mt-3">Do You Want To Logout..</h5>
						<br>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">No</button>
						<a href="LogoutServlet" class="btn btn-primary">Yes</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- logout pop-up -->

</nav>