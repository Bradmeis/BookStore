<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="en_ZA"/> 
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
			<a href="new_customer">New Customer</a>
			</b>
	
	</div>

	<div align="center">
		<hr width="60%" />
		<h3>Recent Sales:</h3>
		<table border="1">
			<tr>
				<th>Order ID</th>
				<th>Ordered By</th>
				<th>Book Copies</th>
				<th>Total</th>
				<th>Payment Method</th>
				<th>Status</th>
				<th>Order Date</th>
			</tr>
		
			<c:forEach  items="${ listMostRecentSales}" var="order" varStatus="status">
			<tr>
				<td><a href="view_order?id=${order.orderId}">${order.orderId}	</a></td>

				<td>${order.customer.fullname}</td>

				<td>${order.bookCopies}</td>
				
				<td><fmt:formatNumber value="${order.total}" type="currency"/></td>
				
				<td>${order.paymentMethod}</td>
				
				<td>${order.status}</td>
				
				<td>${order.orderDate}</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>

	<div align="center">
			
		<h3>Recent Views:</h3>
		
		<table border="1">
			<tr>
				<th>Book</th>
				<th>Rating</th>
				<th>Headline</th>
				<th>Customer</th>
				<th>Review On</th>
			</tr>
		
			<c:forEach  items="${ listMostRecent}" var="review" varStatus="status">
			<tr>
				<td>${review.book.title}</td>
				<td>${review.rating}</td>
				<td><a href="edit_review?id=${review.reviewId}">${review.headline}</a>	</td>
				<td>${review.customer.fullname}</td>
				<td>${review.reviewTime}</td>
			</tr>
			</c:forEach>
			
		</table>
		
	</div>

	<div align="center">
		
		<h3>Statistics:</h3>
		<hr width="60%" />
		Total Users: ${totalUsers}
		&nbsp;&nbsp;&nbsp;
		Total Books: ${totalBooks }
		&nbsp;&nbsp;&nbsp; 
		Total Customers: ${totalCustomers }
		&nbsp;&nbsp;&nbsp;
		Total Reviews: ${totalReviews }
		&nbsp;&nbsp;&nbsp; 
		Total Orders: ${totalOrders }
		<hr width="60%" />
	</div>
	<jsp:include page="footer.jsp" />
</body>

</html>