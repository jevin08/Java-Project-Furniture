<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%
final int AGE_LIMIT = 12;
Date date = new Date();
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
date.setYear(date.getYear() - AGE_LIMIT);
String pathToHome="./";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.form-control {
	width: 95%;
	margin-left: 10px;
	margin-right: 15px;
}
</style>
</head>
<body>

	<div class="global-container">
		<div class="d-flex justify-content-center py-5">
			<form class="container rounded border border-primary w-100 d-flex"
				action="signup" method="Post">
				<div class="left col w-50 p-3">
					<div class="row pt-2">
						<label for="userName" class="form-label">User name</label> <input
							type="text" class="form-control" name="userName" id="username"
							placeholder="Enter User Name here" aria-describedby="nameHelp"
							required>
						<div id="nameHelp" class="form-text"></div>
						<div class="invalid-feedback">Please enter a user name.</div>
					</div>
					<div class="row pt-2">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" name="email" id="email"
							value="${customer.email}" placeholder="Enter Email Address here"
							aria-describedby="emailHelp" required>
						<div id="emailHelp" class="form-text"></div>
						<div class="invalid-feedback">Please enter a email id.</div>
					</div>
					<div class="row pt-2">
						<label for="upass" class="form-label">Password</label> <input
							type="password" class="form-control" name="password"
							id="password" placeholder="Enter Password here"
							aria-describedby="passHelp" required>
						<div id="passHelp" class="form-text"></div>
						<div class="invalid-feedback">Please enter a Password.</div>
					</div>
					<div class="row pt-2">
						<label for="uconfirmpass" class="form-label">Confirm
							Password</label> <input type="password" class="form-control"
							name="confirm-password" id="confirm-password"
							placeholder="Reenter Password here"
							aria-describedby="confirm-passHelp" required>
						<div id="confirm-passHelp" class="form-text"></div>
						<div class="invalid-feedback">Please enter a confirm
							password.</div>
					</div>
					<div class="py-2">
						<label>Already have account? </label> <a href="login">Login</a>
					</div>
				</div>
				<div class="right col w-50 p-3">
					<div class="row pt-2">
						<label for="firstName" class="form-label">First Name</label> <input
							type="text" class="form-control" name="firstName" id="firstName"
							value="${customer.firstName}" placeholder="Enter First Name here"
							aria-describedby="firstnameHelp" required>
						<div id="firstnameHelp" class="form-text"></div>
						<div class="invalid-feedback">Please enter a first name.</div>
					</div>
					<div class="row pt-2">
						<label for="lastName" class="form-label">Last Name</label> <input
							type="text" class="form-control" name="lastName" id="lastName"
							value="${customer.lastName}" placeholder="Enter Last Name here"
							aria-describedby="lastnameHelp" required>
						<div id="lastnameHelp" class="form-text"></div>
						<div class="invalid-feedback">Please enter a last name.</div>
					</div>
					<div class="row pt-2">
						<label for="phone" class="form-label">Primary phone number</label>
						<input type="text" class="form-control" name="phone" id="phone"
							value="${customer.phone}"
							placeholder="Enter Primary Phone Number here"
							aria-describedby="phoneHelp" required>
						<div id="phoneHelp" class="form-text"></div>
						<div class="invalid-feedback">Please enter a primary phone
							number.</div>
					</div>
					<div class="row pt-2">
						<label for="secondaryPhone" class="form-label">Secondary
							phone number</label> <input type="text" class="form-control"
							name="secondaryPhone" id="secondaryPhone"
							value="${customer.secondaryPhone}"
							placeholder="Enter Secondary Phone number here"
							aria-describedby="secondaryPhoneHelp" required>
						<div id="secondaryPhoneHelp" class="form-text"></div>
						<div class="invalid-feedback">Please enter a secondary phone
							number name.</div>
					</div>
					<div class="row pt-2">
						<label for="birthDate" class="form-label">Birth Date</label> <input
							type="date" min=0 class="form-control" name="birthDate"
							id="birthDate" value="${customer.birthDate}"
							placeholder="Enter Birth Date here"
							aria-describedby="birthdateHelp"
							max="<%= (new SimpleDateFormat("yyyy-MM-dd")).format(date) %>"
							required>
						<div id="birthdateHelp" class="form-text"></div>
						<div class="invalid-feedback">Please enter a birth date.</div>
					</div>
					<div class="pt-2">
						<button type="submit" class="btn btn-primary">SignIn</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>