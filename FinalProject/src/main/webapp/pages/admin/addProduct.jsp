<%@page import="java.util.List"%>
<%@page import="com.furniture.FinalProject.Model.ImgColor"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Add Product</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.0/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		@media (min-width: 576px) {
			#staticBackdrop .modal-dialog {
				max-width: 100% !important;
			}
		}
		table,
		tr,
		td,
		th {
			text-align: center;
		}
		.preview_img {
			max-width: 300px;
			max-height: 300px;
		}
		
		span#ColorHelpSpan{
			width: 60px;
			height: 24px;
			display: block;
		}
	</style>
</head>

<body>
	<%@ include file="container/header.jsp" %>
	
			<!-- Button trigger modal -->
		<nav class="nav nav-pills nav-justified">
			<button type="button" class="btn btn-primary nav-link" data-bs-toggle="modal" data-bs-target="#addColorModal">
			  Add Color
			</button>
		</nav>
		
		<!-- Add Color Modal -->
		<div class="modal fade" id="addColorModal" tabindex="-1" aria-labelledby="addColorModal" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="addColorModalLabel">Add Color</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       	<form target="_blank" action="addColor" method="post">
					<label for="color" class="d-flex form-label w-100 justify-content-between" style="">Color
						<span class="rounded border" id="ColorHelpSpan"></span>
					</label>
					<input type="text" class="form-control" name="color" id="color" value="#f2d2a1" onchange=updateColor(this) aria-describedby="ColorHelp" required>
					<div class="invalid-feedback">Please enter a color.</div>
		      		<div class="modal-footer">
			    	    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-primary">Save changes</button>
			      </div>
		       	</form>
		      </div>
		      
		    </div>
		  </div>
		</div>
		
	
	
	<div class="container d-flex justify-content-center py-5">
		<form class="rounded border border-primary p-3 row" action="" method="POST" modelAttribute="filterListWrapper" enctype="multipart/form-data">
			<div class="col-xs-12 col-md-6">
			<table id="myTable" class="table table-striped table-hover table-sm container col-xs-12 col-md-6" path="product">
				<tr>
					<th style="text-align:center"><b>URL</b></th>
				<!--<th style="text-align:center"><b>Upload images</b></th>-->
					<th style="text-align:center"><b>Color</b></th>
				</tr>
					<tr>
						
						<select name="isUrl" id="format0" hidden>
							<option value="false">File</option>
							<option value="true" selected>URL</option>
						</select>
						<td>
							<div class="d-flex">
								<div id="photo-div">
									<input type="url" name="photoName" class="p-1" id="photo" onchange="urlChange(this)">
								</div>
								<button type="button" class="btn" id="photo-btn0" data-bs-toggle="modal" onclick="myModel(this)" data-target="#staticBackdrop">
								<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15"
											fill="currentColor" class="bi bi-arrows-angle-expand" viewBox="0 0 16 16">
										<path fill-rule="evenodd"
											d="M5.828 10.172a.5.5 0 0 0-.707 0l-4.096 4.096V11.5a.5.5 0 0 0-1 0v3.975a.5.5 0 0 0 .5.5H4.5a.5.5 0 0 0 0-1H1.732l4.096-4.096a.5.5 0 0 0 0-.707zm4.344-4.344a.5.5 0 0 0 .707 0l4.096-4.096V4.5a.5.5 0 1 0 1 0V.525a.5.5 0 0 0-.5-.5H11.5a.5.5 0 0 0 0 1h2.768l-4.096 4.096a.5.5 0 0 0 0 .707z">
										</path>
									</svg>
									</button>
							</div>
						</td>
						<td><select class="form-select0" id="color" name="color">
							<c:forEach items="${colors}" var="clr">
								<option value="${clr}">${clr}</option>
				     		</c:forEach>
						</select></td>
					</tr>
			</table>
			</div>
			<!-- <button class="btn btn-primary" onclick="addRow()">Add</button> -->
			<div class="col-xs-12 col-md-6">
				<label for="name" class="form-label">Product Name</label>
				<input type="text" class="form-control" name="name" id="name" aria-describedby="NameHelp" required>
				<div id="NameHelp" class="form-text"></div>
				<div class="invalid-feedback">Please enter a product name.</div>
			</div>
			<div class="col-xs-12 col-md-6">
				<label for="discription" class="form-label">Product Description</label>
				<textarea class="form-control" name="container" id="discription" aria-describedby="DiscHelp"
					required></textarea>
				<div id="DiscHelp" class="form-text"></div>
				<div class="invalid-feedback">Please enter a product description.</div>
			</div>
			<div class="col-xs-12 col-md-6">
				<label for="price" class="form-label">Product Price</label>
				<input type="number" step="0.01" min=0 class="form-control" name="price" id="price"
					aria-describedby="pPriceHelp" required>
				<div id="pPriceHelp" class="form-text"></div>
				<div class="invalid-feedback">Please enter a product price.</div>
			</div>
			<div class="col-xs-12 col-md-6">
				<label for="discount" class="form-label">Product Discount</label>
				<input type="number" step="0.01" min=0 max=95 class="form-control" name="discount" id="discount"
					aria-describedby="discountHelp" required>
				<div id="discountHelp" class="form-text"></div>
				<div class="invalid-feedback">Please enter a product price.</div>
			</div>
			<div class="col-xs-12 col-md-6">
				<label for="stock" class="form-label">Product Stock</label>
				<input type="number" step="1" min=0 class="form-control" name="stock" id="stock"
					aria-describedby="pStockHelp" required>
				<div id="pStockHelp" class="form-text"></div>
				<div class="invalid-feedback">Please enter a product Stock.</div>
			</div>
			<div class="col-xs-12 col-md-6">
				<c:forEach items="${filterListWrapper.filterList}" var="filter" varStatus="i">
				   	<label for="filter" class="form-label">${filter.filterType }</label>
					<input type="hidden" path="filterList[${i.index}].filterType" name="filterList[${i.index}].filterType" value="${filter.filterType}" />
					  <c:forEach items="${filter.filterValues}" var="filterVal" varStatus="j">
						<div class="form-check ms-3">
						  <input path="filterList[${i.index}].filterValues[${j.index}].value" name="filterList[${i.index}].filterValues[${j.index}].value" class="form-check-input" type="checkbox" value="${filterVal.value}" id="flexCheckDefault">
						  <label class="form-check-label" for="flexCheckDefault">
						    ${filterVal.value}
						  </label>
						</div>
					  </c:forEach>
					</select>
				</c:forEach>
			</div>
			<button type="submit" class="btn btn-primary col-12 mt-2">Add Product</button>
		</form>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<!-- Vertically centered modal -->
		<div class="modal-dialog modal-dialog-centered" style="max-width: 90%!important; width:auto">
			<div class="modal-content bg-transparent">
				<div class="modal-header border-bottom-0 btn-secondary" data-bs-dismiss="modal" aria-label="Close">
					<svg xmlns="http://www.w3.org/2000/svg" role="button" width="24" height="24" fill="currentColor"
						class="bi bi-arrows-angle-contract" viewBox="0 0 16 16">
						<path fill-rule="evenodd"
							d="M.172 15.828a.5.5 0 0 0 .707 0l4.096-4.096V14.5a.5.5 0 1 0 1 0v-3.975a.5.5 0 0 0-.5-.5H1.5a.5.5 0 0 0 0 1h2.768L.172 15.121a.5.5 0 0 0 0 .707zM15.828.172a.5.5 0 0 0-.707 0l-4.096 4.096V1.5a.5.5 0 1 0-1 0v3.975a.5.5 0 0 0 .5.5H14.5a.5.5 0 0 0 0-1h-2.768L15.828.879a.5.5 0 0 0 0-.707z" />
					</svg>
				</div>
				<div class="modal-body">
					<img id="model-image" width="100%" height="100%" />
				</div>
			</div>
		</div>
	</div>

	<%@ include file="container/popup.jsp" %>
	<%@ include file="container/footer.jsp" %>
	
	<script type="text/javascript">
		let index = 0;
		//let thisColors=${colors};
		//let colorOption =  '<select id="select-clr" class="form-select"><option selected>Select color</option>';
		//for(int i=0; i<colors.size(); i++){
		//	colorOption += `<option value=${colors[i]}>${colors[i]}</option>`; 
		//}
		let colorOption='<option selected>Select color</option><option value=""></option>';
		
		function photoChange(This) {
			let index = This.id.replace("photo", "");
			var reader = new FileReader();
			if (This.files[0].type.indexOf("image") == -1) {
				alert("Invalid Type");
				$("#image"+index).attr("src", "blank");
				$("#image"+index).hide();
				$('#photo'+index).wrap('<form>').closest('form').get(0).reset();
				$('#photo'+index).unwrap();
				return false;
			}
			reader.onload = function (e) {
				// get loaded data and render thumbnail.
				document.getElementById("model-image").src = e.target.result;
			};
			// read the image file as a data URL.
			reader.readAsDataURL(This.files[0]);
		};

		function urlChange(This) {
			console.log(This.value);
			document.getElementById("model-image").src = This.value;
		}

		function changeFormat(This) {
			let index = This.id.replace("format", "");
			let photoDivId = "photo-div" + index;
			val = This.value;
			// val==1 then its is url
			if (val == 1) {
				document.getElementById(photoDivId).innerHTML = '<input type="url" name="product.picture['+index+'].photoName" id="url'+index+'" onchange="urlChange(this)">';
			} else {
				document.getElementById(photoDivId).innerHTML = '<input type="file" name="product.picture['+index+'].photoName" id="photo'+index+'" accept="image/*" onchange="photoChange(this)">';
			}
		}

		function addRow() {
			console.log(index);
			let containt = '<tr><td><select name="product.picture['+index+']isUrl" id="format'+index+'" onchange="changeFormat(this)"><option value="0">File</option><option value="1">URL</option></select></td><td><div class="d-flex"><div id="photo-div'+index+'"><input type="file" name="product.picture['+index+'].photoName" class="p-1" id="photo'+index+'" accept="image/*"></div><button type="button" class="btn" id="photo-btn'+index+'" data-bs-toggle="modal"onclick="showModel(this)"><svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor"class="bi bi-arrows-angle-expand" viewBox="0 0 16 16"><path fill-rule="evenodd"d="M5.828 10.172a.5.5 0 0 0-.707 0l-4.096 4.096V11.5a.5.5 0 0 0-1 0v3.975a.5.5 0 0 0 .5.5H4.5a.5.5 0 0 0 0-1H1.732l4.096-4.096a.5.5 0 0 0 0-.707zm4.344-4.344a.5.5 0 0 0 .707 0l4.096-4.096V4.5a.5.5 0 1 0 1 0V.525a.5.5 0 0 0-.5-.5H11.5a.5.5 0 0 0 0 1h2.768l-4.096 4.096a.5.5 0 0 0 0 .707z" /></svg></button><button type="button" class="btn" id="delete-btn'+index+'" onclick="deleteRow(this);"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="text-danger bi bi-x-lg" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/><path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/></svg></button></div></td><td><select class="form-select'+index+'" >${colorOption}</select></td></tr>';
			let tbody = document.createElement('tbody');
			tbody.setAttribute('id', 'tbody-' + index);
			tbody.innerHTML = containt;
			document.getElementById("myTable").appendChild(tbody);
			index++;
		}


		function deleteRow(This) {
			if (confirm("Do you realy wan't to delete this ?")) {
				let index = This.id.replace("delete-btn", "");
				document.getElementById("myTable").removeChild(document.getElementById('tbody-'+index));
			}
		}
		function myModel(This){
			if (document.getElementById("photo").value == "") {
				return;
			}
			$("#staticBackdrop").modal("show");
		}
		function showModel(This) {
			console.log(This.id);
			let index = This.id.replace("photo-btn", "");
			let photoId = "photo" + index;
			let urlId = "url" + index;
			if (document.getElementById(urlId) != null) {
				if (document.getElementById(urlId).value == "") {
					return;
				}
				urlChange(document.getElementById(urlId));
				$("#staticBackdrop").modal("show");
				return;
			}
			if (document.getElementById(photoId).files.length == 0) {
				$("#staticBackdrop").modal("hide");
				return;
			}
			photoChange(document.getElementById(photoId));
			$("#staticBackdrop").modal("show");
		}


		// Live color updation 
		function updateColor(color){
			document.getElementById("ColorHelpSpan").style.background = color.value;
		}
		</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>