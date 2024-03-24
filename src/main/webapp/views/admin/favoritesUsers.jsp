<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="container mt-2">
		<div class="mt-2"><jsp:include page="baocao-thongke.jsp"></jsp:include></div>
		<div class="row">
			<lable class="col-2 mt-3" style="width: 130px;">Video Title ?</lable>
			<select class="form-select col-10 w-75 mt-2" aria-label="Default select example">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select>			
		</div>		
		<table class="table table-bordered mt-2">
			<thead>
				<th>User Name</th>
				<th>Full Name</th>
				<th>Email</th>
				<th>Favtire Date</th>
			</thead>
			<tbody>
				<td>abc</td>
				<td>100</td>
				<td>31/12/2020</td>
				<td>01/01/2020</td>
			</tbody>
		</table>
	</div>
</body>
</html>