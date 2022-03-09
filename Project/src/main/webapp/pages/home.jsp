<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="container/header.jsp" %>
	<div class="container d-flex p-3">
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<% for(int i=0; i<5; i++){ %>
			<div class="col">
				<div class="card" style="width: 18rem;">
				  <img src="./ProductImages/" class="card-img-top" alt="...">
				  <div class="card-body">
					 <h5 class="card-title">Card title</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Go somewhere</a>
				  </div>
				</div>
			</div>
		<% } %>
	</div>
	</div>	
	<%@ include file="container/popUp.jsp" %>
</body>
</html>