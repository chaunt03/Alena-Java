<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<link	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
			rel="stylesheet" 
			integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
			crossorigin="anonymous">
		
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div class="container mt-2">
	<c:url var="url" value="/form"></c:url>
		<div class="row m-1">
			<div class="col-4"></div>
			<div class="col-4">
				<form action="/AssignmentJava4/layout" method="post">
					<div class="mb-3">
						<label class="form-label">Username</label> <input
							value= "${sessionScope.user.id}" name="id" placeholder="Username?" type="text"
							class="form-control">
					</div>
					<div class="mb-3">
						<label class="form-label">Password</label>
						<input name="password"value="${sessionScope.user.password}"
							placeholder="Password?" type="password" class="form-control">
					</div>
					<div class="mb-3">
						<label class="form-label">Fullname</label> <input
						 name="fullname" placeholder="Fullname?" value="${sessionScope.user.fullname}"
							type="text" class="form-control">
					</div>
					<div class="mb-3">
						<label class="form-label">Email address</label> <input
							name="email" placeholder="Email Address?"
							type="text" class="form-control" value= "${sessionScope.user.email}">
					</div>
					<div class="mb-3">
						<input name="admin" type="radio"
							value="true">Admin <input
							name="admin" type="radio" value="false">User
					</div>
					<p class="text-danger fw-bold">${message}</p>
					<hr>
					<div class="text-right">
						<button formaction="${url}/editprofile" class="btn btn-primary">Update</button>
					</div>
				</form>
			</div>
			<div class="col-4"></div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>