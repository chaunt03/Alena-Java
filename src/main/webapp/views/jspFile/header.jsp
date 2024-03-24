<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<c:url var="url" value="/home"></c:url>
		<div class="container-fluid">
			<a class="navbar-brand" href="/AssignmentJava4/layout">ONLINE
				ENTERTAINMENT</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${url}/favorite">My Favorite</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> My Account </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${url}/login">Login</a></li>
							<li><a class="dropdown-item" href="${url}/forgotpassword">Forgot
									Password</a></li>
							<li><a class="dropdown-item" href="${url}/registration">Registration</a></li>
							<li><a class="dropdown-item" href="${url}/logoff">Logoff</a></li>
							<li><a class="dropdown-item" href="${url}/changepassword">Change
									Password</a></li>
							<li><a class="dropdown-item" href="${url}/editprofile">Edit
									Profile</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Language </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">VietNamese</a></li>
							<li><a class="dropdown-item" href="#">English</a></li>
						</ul></li>
				</ul>
				<ul class="nav justify-content-end">
					<c:choose>
						<c:when test="${empty sessionScope.user}">
						Welcome
					</c:when>
						<c:otherwise>
						Welcome ${sessionScope.user.fullname}
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>