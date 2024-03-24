<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
		<c:url var="url" value="/admin"></c:url>
		<div class="container-fluid">
			<a class="navbar-brand fw-bold text-warning" href="${url}/layoutAdmin">ADMINISTRATION
				TOOL</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 text-danger">
					<c:choose>
						<c:when test="${empty sessionScope.user}">
						Welcome
					</c:when>
						<c:otherwise>
						Welcome ${sessionScope.user.fullname}
					</c:otherwise>
					</c:choose>
				</ul>
				<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link fw-bold" href="${url}/logoff" style="color: rgb(0, 255, 221);">LOGOFF</a></li>
						<li class="nav-item"><a class="nav-link active fw-bold" style="color: rgb(0, 255, 221);"
							aria-current="page" href="/AssignmentJava4/layout">HOME</a></li>
						<li class="nav-item"><a class="nav-link fw-bold" href="${url}/editvideo" style="color: rgb(0, 255, 221);">VIDEOS</a></li>
						<li class="nav-item"><a class="nav-link fw-bold" href="${url}/edituser" style="color: rgb(0, 255, 221);">USERS</a></li>
						<li class="nav-item"><a class="nav-link fw-bold" href="${url}/report" style="color: rgb(0, 255, 221);">REPORTS</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>