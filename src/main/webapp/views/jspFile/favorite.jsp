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
<title>Favorite</title>
</head>
<body>
	<div class="container">
		<br>
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="item" items="${fav_like}">
				<div class="col">
					<div class="card h-100">
						<a href="/AssignmentJava4/details?id=${item.video.id}"><img
							src="/AssignmentJava4/views/pictures/${item.video.poster}"
							class="card-img-top" alt="POSTER"></a>
						<div class="card-body">
							<div class="card-body" style="background-color: aquamarine;">
								<h5 class="card-title">${item.video.title}</h5>
							</div>
							<div class="card-body d-md-flex justify-content-md-end">
								<a class="btn btn-danger me-md-2" href="unlike?videoId=${item.video.id}">Unlike</a>
								<button class="btn btn-warning">Share</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>