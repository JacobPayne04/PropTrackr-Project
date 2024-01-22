<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/s.css" />
<!-- For any Bootstrap that uses JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Proptrackr</title>
</head>
<body data-bs-theme="dark">
    <h1>Change your Entry</h1>
    <form:form action="/rentals/process/edit/${rental.id}" method="post" modelAttribute="rental">
        <input type="hidden" name="_method" value="patch">
        <form:input type="hidden" path="user" value="${user_id}"/>
        <p>
			<a href="/rentals"><button
					class="btn btn-outline-info">Go Back</button></a>
		</p>
        <div class="form-group">
            <p>address: </p>
            <form:input type="text" path="address" class="form-control"></form:input>
            <form:errors path="address" />
        </div>
        <div class="form-group">
            <p>zip: </p>
            <form:input type="text" path="zip" class="form-control"></form:input>
            <form:errors path="zip" />
        </div>
        <div class="form-group">
            <p>state: </p>
            <form:input type="text" path="state" class="form-control"></form:input>
            <form:errors path="state" />
        </div>
        <div class="form-group">
            <p>renter first name: </p>
            <form:input type="text" path="fname" class="form-control"></form:input>
            <form:errors path="fname" />
        </div>
         <div class="form-group">
            <p>renter last name: </p>
            <form:input type="text" path="lname" class="form-control"></form:input>
            <form:errors path="lname" />
        </div>
         <div class="form-group">
            <p>lease length: </p>
            <form:input type="text" path="leaselength" class="form-control"></form:input>
            <form:errors path="leaselength" />
        </div>
        <input type="submit" value="Add Rental" class="btn btn-primary" />
        <form action="/rentals/delete/${rental.id}" method="post">
			<input type="hidden" name="_method" value="DELETE" /> <input
				type="submit" value="delete" class="btn btn-outline-danger" />
		</form>
    </form:form>
  
		
</body>
</html>