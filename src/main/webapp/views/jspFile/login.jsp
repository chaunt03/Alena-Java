<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class="container mt-2">
	<c:url var="url" value="/form"></c:url>
		<br>
		<div class="row m-1">
			<div class="col-4"></div>
			<div class="col-4">
				<form action="/AssignmentJava4/layout" method="post">
					<div class="card">
						<div class="card-body" style="background-color: #E2F0D9;">
							<h5>
								<strong>LOGIN</strong>
							</h5>
						</div>
						<div class="card-body border border-1">
							<form>
								<label>Username ?</label>
								</p>
								<input name="username" type="text" class="w-100">
								</p>
								<label>Password ?</label>
								</p>
								<input name="password" type="password" class="w-100">
								</p>
								<input name="remember" type="checkbox"> Remember me ?
								<p class="text-success">${message}</p>
							</form>
						</div>
						<div
							class="card-footer d-grid gap-2 d-md-flex justify-content-md-end"
							style="background-color: #F2F2F2;">
							<button class="btn btn-warning" formaction="${url}/login">Login</button>
						</div>
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