<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/showOne.css" />
<!-- For any Bootstrap that uses JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Proptrackr</title>
<link rel="icon" type="image/x-icon" href="/pictures/prop.jpg" />
</head>
<body  class="container" data-bs-theme="dark">
<div>

		<nav class="navbar navbar-dark bg-dark">
			<div class="container-fluid">
				<!-- H1 heading on the left -->
				<h1 class="navbar-brand">PropTrackr</h1>
				<img class="logo" src="/pictures/prop.jpg" alt="" />
				

				<!-- "Sign Out" button on the right -->
				<div class="d-flex">
					<!-- Add your Sign Out button code here -->
					<a href="/logout"><button class="btn btn-light me-2">Sign
							Out</button></a>

				</div>
			</div>
		</nav>
</div>

		<h1>Hi, ${oneUser.userName} <p>
			 <a href="/rentals"><button
					class="btn btn-outline-info">Go Back</button></a>
		</p></h1>
	<div class="showOneBox"   >
		<p>
			Renter Name:
			<c:out value="${ oneRental.fname}" />
			<c:out value="${ oneRental.lname}" />
		</p>
		<p>Address : 
			<c:out value="${ oneRental.address}" />
		</p>
		<p>Zip : 
			<c:out value="${ oneRental.zip}" />
		</p>
		<p>State : 
			<c:out value="${ oneRental.state}" />
		</p>
		<p>Lease Length: 
			<c:out value="${ oneRental.leaselength}" />
		</p>
	</div>



</body>
</html>