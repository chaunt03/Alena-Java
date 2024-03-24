<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	sr="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>

<div class="container">
	<div class="mt-2"></div>
	<h1 class="mt-2 text-center text-uppercase">Quản Lý User</h1>
	<c:url var="url" value="/user"></c:url>
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<form class="form-control mt-2 mb-2" action="/index" method="post">
				<div class="row g-3">
					<div class="col">
						<label>UserName ?</label> <input type="text" class="form-control"
							aria-label="Username" name="id" value="${form.id }">
					</div>
					<div class="col">
						<label>Current PassWord ?</label> <input type="password"
							class="form-control" name="password" value="${form.password }">
					</div>
				</div>

				<div class="row g-3">
					<div class="col">
						<label>Full Name</label> <input type="text" class="form-control"
							name="fullname" value="${form.fullname }">
					</div>
					<div class="col">
						<label>Email</label>
						<input type="text" class="form-control" name="email"
							value="${form.email }">
					</div>
				</div>
				<input name="admin" type="radio" value="true" ${form.admin?'checked':''} >Admin
				<input name="admin" type="radio" value="false" ${form.admin?'':'checked'}>User
				<p class="text-danger">${message}</p>
				<div
					class="card-footer d-grid gap-2 d-md-flex justify-content-md-end mt-2 mb-2">
					<button formaction="${url}/update" name="update" type="submit"
						class="btn btn-secondary mt-1 mb-1" style="color: red;">
						<strong>Update</strong>
					</button>
					<button formaction="${url}/delete" name="delete" type="submit"
						class="btn btn-secondary mt-1 mb-1" style="color: red;">
						<strong>Delete</strong>
					</button>
				</div>
			</form>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Password</th>
					<th scope="col">Fullname</th>
					<th scope="col">Email</th>
					<th scope="col">Role</th>
					<th scope="col">Edit</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${user}">
					<tr>
						<th scope="row">${item.id}</th>
						<td>${item.password}</td>
						<td>${item.fullname}</td>
						<td>${item.email}</td>
						<td>${item.admin?'Admin':'User'}</td>
						<td><a href="${url}/edit/${item.id}">Edit</a></td>
					</tr>	
				</c:forEach>
			</tbody>
		</table>
		<div class="card-footer  mt-2 mb-2" style="background-color: #F2F2F2;">
			<div class="row">
				<div class="col-2">
					<label class="m-2">85 videos</label>
				</div>
				<div
					class="col-10 d-grid gap-2 d-md-flex justify-content-md-end ms-auto">
					<button name="create" type="submit"
						class="btn btn-secondary mt-1 mb-1">
						<strong>|<</strong>
					</button>
					<button name="update" type="submit"
						class="btn btn-secondary mt-1 mb-1">
						<strong><<</strong>
					</button>
					<button name="delete" type="submit"
						class="btn btn-secondary mt-1 mb-1">
						<strong>>></strong>
					</button>
					<button name="reset" type="submit"
						class="btn btn-secondary mt-1 mb-1">
						<strong>>|</strong>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>