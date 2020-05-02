<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Evergreen Bookstore Administration</title>
	<style>
     <%@ include file="../css/style.css"%>
	</style>
	
</head>
<body  >

	<div class="logo">
	<jsp:include page="header.jsp" />
	</div>
	<div align="center">
		<h2>Administrative Dashboard</h2>
		
	</div>

	<div align="center">
	<hr width="60%"/>
		<h2>Quick Actions:</h2>
			<b>
			<a href="new_book">New Book</a> &nbsp;
			<a href="user_form.jsp">New User</a> &nbsp;
			<a href="category_form.jsp">New Category</a> &nbsp;
			<a href="customer_form.jsp">New Customer</a>
			</b>
	
	</div>
	
	<div align="center">
	<hr width="60%"/>
		<h3>Recent Sales:</h3>
	</div>
	
	<div align="center">
	<hr width="60%"/>
		<h3>Recent Views:</h3>
	</div>
	
	<div align="center">
	<hr width="60%"/>
		<h3>Statistics:</h3>
		Total Users: &nbsp;&nbsp;&nbsp;Total Books: 
		Total Users: &nbsp;&nbsp;&nbsp;Total Books:
		Total Customers: &nbsp;&nbsp;&nbsp;Total Reviews:&nbsp;&nbsp;&nbsp;
		Total Orders:
		<hr width="60%"/>
	</div>
	<jsp:include page="footer.jsp" />
</body>

</html>