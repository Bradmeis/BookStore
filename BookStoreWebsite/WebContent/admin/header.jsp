<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<link rel="stylesheet" href="../css/style.css"> 
<div align="center">

	<div>
		<a href="${pageContext.request.contextPath }/admin/"><img src="../images/logo.png" /></a>
	</div>

	<div>
		Welcome, <c:out value="${sessionScope.useremail }"/> | <a href="logout">Logout</a> <br /> <br />
	</div>

	<div id="headermenu">
		<div>
			<a href="list_users"> <img width="50" height="50"
				src="../images/user.png"><br />Users
			</a>
		</div>

		<div >
			<a href="list_category"> <img width="50" height="50"
			src="../images/category.jpg"><br />Categories
			</a>
		</div>

		<div>
			<a href="list_books"> <img width="50" height="50"
			src="../images/books.png"><br />Books
			</a>
		</div>

		<div>
			<a href="list_customer"> <img width="50" height="50"
			src="../images/customers.png"><br />Customers
			</a>
		</div>

		<div>
			<a href="list_review"> <img width="50" height="50"
			src="../images/reviews.png"><br />Reviews
			</a>
		</div>

		<div>
			<a href="list_order"> <img width="50" height="50"
			src="../images/orders.png"><br />Orders
			</a>
		</div>

	</div>
</div>