<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
			rel="stylesheet" 
			integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
			crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
			crossorigin="anonymous"></script>
	
	<title>Insert title here</title>
	
</head>
<body>
	<div class="container">
	<div class="menu sticky-top">
	</div>
	<h1 class="mt-2 text-center text-uppercase">Quản Lý Video</h1>
	<c:url var="url" value="/video"></c:url>
	<div class="row">
			<div class="col-6 ">
				<div class="card mt-2 h-100">
				  <div class="border border-1 rounded-2 m-4 h-100">
				  	<a href="#"><img src="/AssignmentJava4/views/pictures/${form.poster}" class="card-img-top w-75 m-5" alt=""></a>
				  </div>
				</div>
			</div>
			<div class="col-6">
				<form action="${url}/index" method="post" class="form-control w-100 h-100 mt-2">
					<label class="mt-4">PICTURE LINK ?</label> <br>
					<input class="w-100" name="poster" type="text" value="${form.poster}"> </p>
					<label class="mt-4">YOUTUBE ID ?</label> <br>
					<input class="w-100" name="id" type="text" value="${form.id}"> </p>
					<label>VIDEO TITLE ?</label> <br>
					<input class="w-100" name="title" type="text" value="${form.title}"> </p>
					<label>VIEW COUNT ?</label> <br>
					<input class="w-100" name="views" type="text" value="${form.views}"> </p>
					<label>HREF VIDEO?</label> <br>
					<input class="w-100" name="href" type="text" value="${form.href}"> </p>
					<div class="row mx-1">
						<div class="form-check col-4">
							<input ${form.active?'checked': 'Active' } class="form-check-input" type="radio" name="active" id="inactive"> Inactive
						</div>
						<div class="form-check col-4">
							<input ${form.active?'checked': '' }  class="form-check-input" type="radio" name="active" id="active"> Active
						</div>
					</div>
					<div class="mt-2 mb-1">
						<label>DESCRIPTION ?</label> <br>
						<input class="w-100" style="height: 80px" name="description" type="text" value=" ${form.description }">
					</div>
					<p class="text-danger">${message}</p>
					<div class="card-footer d-grid gap-2 d-md-flex justify-content-md-end mt-2 mb-2" style="background-color: #F2F2F2;">
						    <button formaction="${url}/create" name="create" type="submit" class="btn btn-secondary mt-1 mb-1" style="color: red;"><strong>Create</strong></button>
						    <button formaction="${url}/update" name="update" type="submit" class="btn btn-secondary mt-1 mb-1" style="color: red;"><strong>Update</strong></button>
						    <button formaction="${url}/delete" name="delete" type="submit" class="btn btn-secondary mt-1 mb-1" style="color: red;"><strong>Delete</strong></button>
						    <button  formaction="${url}/index" name="reset" type="submit" class="btn btn-secondary mt-1 mb-1" style="color: red;"><strong>Reset</strong></button>
					</div>
				</form>
			</div>
		</div>
		<table class="table table-bordered mt-2">
			<thead>
				<th>Youtube ID</th>
				<th>Video Title</th>
				<th>View Count</th>
				<th>Status</th>
				<th>Edit</th>
			</thead>
	
			<c:forEach var="item" items="${video}">
				<tbody>
					<td>${item.id}</td>
					<td>${item.title}</td>
					<td>${item.views}</td>
					<td>${item.active}</td>
					<td><a name="edit" href="${url}/edit/${item.id}">Edit</a></td>						
				</tbody>
			</c:forEach>
		</table>
		<div class="card-footer  mt-2 mb-2" style="background-color: #F2F2F2;">
			<div class="row">
				<div class="col-2">
					<label class="m-2">85 videos</label>
				</div>
				<div class="col-10 d-grid gap-2 d-md-flex justify-content-md-end ms-auto">
				    <button name="create" type="submit" class="btn btn-secondary mt-1 mb-1" "><strong>|<</strong></button>
				    <button name="update" type="submit" class="btn btn-secondary mt-1 mb-1" "><strong><<</strong></button>
				    <button name="delete" type="submit" class="btn btn-secondary mt-1 mb-1" "><strong>>></strong></button>
				    <button name="reset" type="submit" class="btn btn-secondary mt-1 mb-1" "><strong>>|</strong></button>				
				</div>
			</div>
		</div>
</body>
</html>