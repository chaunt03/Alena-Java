<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<c:url var="url" value="/report"></c:url>
	<div class="mt-2">
	</div>
		<ul class="nav nav-tabs mt-2">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="${url}/favorite">FAVORITES</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="${url}/favoriteuser">FAVORITES USERS</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="${url}/shared">SHARED FRIENDS</a>
		  </li>
		</ul>
	</div>
</body>
</html>