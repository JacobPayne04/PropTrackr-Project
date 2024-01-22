<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/loginreg.css" />
<!-- For any Bootstrap that uses JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>PropTrackr</title>

</head>
<body data-bs-theme="">
	<div>
		<img class="logo" src="/pictures/prop.jpg" alt="" />
		<h1>PropTrackr</h1>
	</div>
	<h3></h3>
	<div class="fullContainer">
		<div style="margin-bottom: 100px;">
			<div class="col">
				<h1>Register</h1>
				<form:form action="/user/process/register" method="post"
					modelAttribute="user">
					<div class="form-group">
						<label>Username: </label>
						<form:input  path="userName" class="form-control w-50" />
						<form:errors path="userName" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Email: </label>
						<form:input path="email" class="form-control w-50" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Password: </label>
						<form:input path="password" class="form-control w-50" />
						<form:errors path="password" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Confirm Password: </label>
						<form:input path="confirm" class="form-control w-50" />
						<form:errors path="confirm" class="text-danger" />
					</div>
					<input type="submit" value="Submit" class="btn btn-primary" />
				</form:form>
			</div>
			<div class="col">
				<h1>log In</h1>
				<form:form action="/user/process/login" method="post"
					modelAttribute="loginUser">
					<div class="form-group">
						<label>Email: </label>
						<form:input path="email" class="form-control w-50" />
						<form:errors path="email" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Password: </label>
						<form:input path="password" class="form-control w-50" />
						<form:errors path="password" class="text-danger" />
					</div>
					<input type="submit" value="Submit" class="btn btn-primary" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>


