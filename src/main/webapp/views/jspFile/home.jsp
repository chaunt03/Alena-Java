<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HomePage</title>
</head>
<body>
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach var="item" items="${video}">
			<div class="col">
				<div class="card h-100">
					<a href="/AssignmentJava4/details?id=${item.id}"><img
						src="/AssignmentJava4/views/pictures/${item.poster}"
						class="card-img-top" alt="POSTER"></a>
					<div class="card-body">
						<div class="card-body" style="background-color: aquamarine;">
							<h5 class="card-title">${item.title}</h5>
						</div>
						<div class="card-body d-md-flex justify-content-md-end">
							<button class="btn btn-success me-md-2"><a href="like?id=${item.id}" class="text-light text-decoration-none">Like</a></button>
							<button class="btn btn-warning">Share</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>