<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@  page import="java.sql.Connection"%>
<%@  page import="com.conn.DbConnect"%>
<%@ include file="component/allCss.jsp"%>

<style type="text/css">
.back-img {
	background: url("image/Phone.jpg");
	width: 100%;
	height: 86vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body class="div-custom">
	<%@ include file="component/navBar.jsp"%>
	
	<div class="container-fluid back-img text-center text-dark ">
		<h1>Welcome to PhoneBook App</h1>
	</div>

	<%@ include file="component/footer.jsp"%>

</body>
</html>