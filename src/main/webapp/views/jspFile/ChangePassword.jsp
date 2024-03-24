<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4 m-1">
				<form action="/AssignmentJava4/layout" method="post">
					<div class="mb-3">
						<label class="form-label">Id</label> <input
							name="id" placeholder="Username?" type="text"
							class="form-control">
					</div>
					<div class="mb-3">
						<label class="form-label">Password</label>
						<input name="password"
							placeholder="Password?" type="password" class="form-control">
					</div>
					<div class="mb-3">
						<label class="form-label">New Password</label> <input
						 name="newpasss" placeholder="newpass"
							type="text" class="form-control">
					</div>
					<div class="mb-3">
						<label class="form-label">Confirm New Password</label> <input
							name="confirm" placeholder="confirm"
							type="text" class="form-control">
					</div>
					<p>${message}</p>
					<hr>
					<div class="text-right">
						<button formaction="${url}/changepassword" class="btn btn-primary">Change</button>
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