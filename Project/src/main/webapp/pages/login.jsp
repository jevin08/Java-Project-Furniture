<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="./">Furniture</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link active" aria-current="page" href="./">Home</a>
				</div>
			</div>
		</div>
	</nav>
	<div class="global-container">
		<div class="d-flex justify-content-center py-5">
			<form class="rounded border border-primary p-3 w-25" action="validateLogin" method="Post">
				<div class="mb-4">
					<label for="uname" class="form-label">User name</label>
					 <input type="text" class="form-control" name="uname" id="uname" aria-describedby="nameHelp" required>
					<div id="nameHelp" class="form-text"></div>
				</div>
				<div class="mb-4">
					<label for="upass" class="form-label">Password</label>
					<input type="password" class="form-control" name="password" id="password" required>
				</div>
				<button type="submit" class="btn btn-primary">Login</button>
				<label>Don't have account? </label>
				<a href="signin">SignIn</a>
			</form>
		</div>
	</div>
	<%@ include file="container/popUp.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>