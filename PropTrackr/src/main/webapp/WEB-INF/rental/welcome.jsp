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
<link rel="stylesheet" href="/css/welcome.css" />
<!-- For any Bootstrap that uses JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>PropTrackr</title>
<link rel="icon" type="image/x-icon" href="/pictures/prop.jpg" />
</head>
<body class="container" data-bs-theme="dark">
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


		<h1>Hi, ${oneUser.userName}</h1>



		<p>
			All Rentals <a href="/rentals/new"><button
					class="btn btn-outline-info">+ new Rental</button></a>
		</p>


		<c:forEach items="${AllRental}" var="rental">
			<div class="rental-container">
				<!-- Repeat this block for each rental -->
				<div class="rental-box">

					<a href="/rentals/show/${rental.id}">${rental.address} <c:if test="${rental.user.id == user_id }"><a href="/rentals/edit/${rental.id}"class="btn btn-outline-warning">Edit</a>
							<form action="/rentals/delete/${rental.id}" method="post">
								<input type="hidden" name="_method" value="DELETE" /> <input
									type="submit" value="delete" class="btn  btn-outline-danger" />
							</form>
						</c:if>
					</a>
					<p>User : ${rental.user.userName}</p>
					<p>Zip : ${rental.zip}</p>
					<p>State : ${rental.state}</p>
					<p>Rent Name : ${rental.fname} ${rental.lname}</p>
					<p>Lease Length : ${rental.leaselength}</p>
					<p></p>

				</div>
			</div>
		</c:forEach>



	</div>
	<hr />
	<footer>

		<div class="Footer-Top-Row">

			<div>
				<p>PropTrackr</p>
				<a class="Footer-Link" href="/profile/pilot/portfolio/about/us">About
					Us</a>
			</div>
			<div>
				<p>Support</p>
				<a class="Footer-Link" href="/profile/pilot/portfolio/help">Help</a>
			</div>
			<div>
				<p>Follow Us</p>

			</div>
		</div>
		<div class="Footer-Bottom-Row">
			<p>&copy; PropTrackr 2023</p>
			<p>- PropTrackr -</p>
			<a class="Footer-Link" href="https://fontawesome.com/">Fonts By
				Font Awesome</a>
		</div>
	</footer>

</body>
</html>