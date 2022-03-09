<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	boolean loginUser = Boolean.valueOf((String)session.getAttribute("loggedIn"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Furniture</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body >
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="">Furniture</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link active" aria-current="page" href="">Home</a>
				</div>
				<%
					if(loginUser){
				%>
				<div class="navbar-nav">
					<a class="nav-link" aria-current="page" href="logout">
						<button class="btn btn-alert">Logout</button>
					</a>
				</div>
				<div class="navbar-nav">
					<a class="nav-link" aria-current="page" href="update">
						<button class="btn btn-primary">Update Profile</button>
					</a>
				</div>
				<%
					}else{
				%>
				<div class="navbar-nav">
					<a class="nav-link" aria-current="page" href="login">
						<button class="btn">Login</button>
					</a>
				</div>
				<div class="navbar-nav">
					<a class="nav-link" aria-current="page" href="signin">
						<button class="btn">SignIn</button>
					</a>
				</div>
				<%
					}
				if(loginUser){
				%>
					<div class="navbar-nav">
						Welcome ${uname}
					</div>
				<% } %>
				
				<div class="cart navbar-nav">
					<button type="button" class="btn btn-primary position-relative" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
					  Cart
					  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">3</span>
					</button>
				</div>
			</div>
		</div>
	</nav>
	
	<div class="modal" tabindex="-1" id="staticBackdrop">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Cart</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
		  <div class="modal-body">
		    <div class="container-fluid">
			  <div class="row">
			  	<div class="col">
	  	    		Product Name
			    </div>
			    <div class="col">
			    	Price
			   	</div>
			  </div>
			  <div class="row">
			    <div class="col">
			   		Product Name
			   	</div>
			   	<div class="col">
			   		Price
		    	</div>
		    </div>
		    <div class="row">
			    <div class="col">
			 		Product Name
			   	</div>
		    	<div class="col">
		    		Price
			   	</div>
			</div>
		   </div>
		  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>