<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<div class="col">
					<div class="card h-100">
						<iframe width="100%" height="500px"
							src="${requestScope.details.href}" title="YouTube video player"
							frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe>
						<div class="card-body">
							<div class="card-body" style="background-color: aquamarine;">
								<h6 class="card-title">${requestScope.details.title}</h6>
							</div>
							<div class="card-body" style="background-color: aquamarine;">
								<p class="card-text">${requestScope.details.description}</p>
							</div>
							<div class="card-body d-md-flex justify-content-md-end">
								<button class="btn btn-success me-md-2">Like</button>
								<button class="btn btn-warning">Share</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<c:forEach var="item" items="${video}">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-4">
								<a class="navbar-brand" href="/AssignmentJava4/details?id=${item.id}"> <img
									src="/AssignmentJava4/views/pictures/${item.poster}"
									alt="Bootstrap" width="120" height="auto">
								</a>
							</div>
							<div class="col-sm-8" style="float: right">
								<p class="card-title">${item.title}</p>
								<br>
							</div>
						</div>
					</div>
				<br>
				</c:forEach>
			</div>
		</div>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>
	</div>
</body>
</html>