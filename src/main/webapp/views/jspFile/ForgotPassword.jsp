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
		<div class="row m-1">
			<div class="col-4"></div>
			<div class="col-4">
				<div class="card">
					<div class="card-body" style="background-color: #E2F0D9;">
						<h5><strong>Forgot Password</strong></h5>
					</div>
					<div class="card-body border border-1">
						<form>
							<label>Username ?</label> </p>
							<input name="username" type="text" class="w-100"></p>
							<label>Email ?</label> </p>
							<input name="email" type="email" class="w-100"></p>
						</form>
					</div>
					<div class="card-footer d-grid gap-2 d-md-flex justify-content-md-end" style="background-color: #F2F2F2;">
					    <button class="btn btn-warning">Retrieve</button>    
				    </div>
				</div>
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