<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	
	<div class="global-container">
		<div class="d-flex justify-content-center py-5 mt-5">
			<form class="rounded border border-primary p-3 w-25" action="login" method="Post">
				<div class="mb-4">
					<label for="userName" class="form-label">User name</label>
					 <input type="text" class="form-control" name="userName" id="userName" aria-describedby="nameHelp" required>
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

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>	
	
</body>
</html>