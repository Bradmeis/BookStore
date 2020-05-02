<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<fmt:setLocale value="en_ZA"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders History- Online Book Store</title>
<link  rel="stylesheet" href="css/style.css" />
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>My Orders History</h2>
	
	
	<c:if test="${fn:length(listOrders) == 0 }">
		<h3>You have not placed any orders</h3>
	</c:if>
	
	<c:if test="${fn:length(listOrders) > 0 }">
	
	<div align="center">
		<table border="1">
			<tr>
				<th>Index</th>
				<th>Order ID</th>
				<th>Quantity</th>
				<th>total Amount</th>
				<th>Order Date</th>
				<th>Status</th>
				<th>Action </th>
			</tr>
			
			<c:forEach var="order" items="${listOrders}" varStatus="status"> 
				<tr>
				<td>${status.index +1}</td>
				<td>${order.orderId}</td>
				<td>${order.bookCopies}</td>
				<td>
					<fmt:formatNumber value="${order.total}" type="currency"/>
				</td>
				<td>${order.orderDate}</td>
				<td>${order.status}</td>
				<td>
					<a href="show_order_detail?id=${order.orderId}">View Details</a> &nbsp;|&nbsp;
				</td>
				<tr/>
			</c:forEach>
			
		</table>
	</div>
	</c:if>
	
	</div>
	<br/>
	<jsp:include page="footer.jsp" />
	
</body>
</html>