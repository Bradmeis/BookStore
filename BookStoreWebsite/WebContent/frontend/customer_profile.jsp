<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile - Online Book Store</title>

<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="header.jsp" />

	<div align="center">
		<br>
		<h2>Welcome, ${loggedCustomer.fullname}</h2>
		<br>
		
		<table style ="border: 0px;">
			<tr>
				<td><b>E-mail Address:</b></td>
				<td>${loggedCustomer.email}</td>
			</tr>
			
			<tr>
				<td><b>Full Name:</b></td>
				<td>${loggedCustomer.fullname}</td>
			</tr>
			
			<tr>
				<td><b>Phone Number:</b></td>
				<td>${loggedCustomer.phone}</td>
			</tr>
			
			<tr>
				<td><b>Address:</b></td>
				<td>${loggedCustomer.address}</td>
			</tr>
			
			<tr>
				<td><b>City:</b></td>
				<td>${loggedCustomer.city}</td>
			</tr>
			
			<tr>
				<td><b>Zip Code:</b></td>
				<td>${loggedCustomer.zipcode}</td>
			</tr>
			
			<tr>
				<td><b>Country:</b></td>
				<td>${loggedCustomer.country}</td>
			</tr>
		</table>
		<br><br>
		<a href="edit_profile">Edit Profile</a>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>