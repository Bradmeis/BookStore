<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="en_ZA"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Order Details </title>
<link rel="stylesheet" href="css/style.css" />
	
</head>
<body>
	<jsp:include page="header.jsp" /><br>
		<div align="center">
	<c:if test="${order == null}">
		<h2>Sorry, you are not authorized to view this order.</h2>
	</c:if>
	
	<c:if test="${order != null}">

		<h2>Your Order ID: ${order.orderId}</h2>
		
	

	<div align="center">
		
		<table border="1">
			
			<tr>
				<td><b>Order Status:</b></td>
				<td>${order.status}</td>
			</tr>
				
			<tr>
				<td><b>Order Date:</b></td>
				<td>${order.orderDate}</td>
			</tr>
			
			<tr>
				<td><b>Quantity:</b></td>
				<td>${order.bookCopies}</td>
			</tr>
			
			<tr>
				<td><b>Total Amount:</b></td>
				<td>
				<fmt:formatNumber value="${order.total}" type="currency"/>
				</td>
			</tr>
			
			<tr>
				<td><b>Recipient Name:</b></td>
				<td>${order.recipientName}</td>
			</tr>
			
			<tr>
				<td><b>Recipient Phone:</b></td>
				<td>${order.recipientPhone}</td>
			</tr>
			
			<tr>
				<td><b>Ship To:</b></td>
				<td>${order.shippingAddress}</td>
			</tr>
			
			<tr>
				<td><b>Payment Method:</b></td>
				<td>${order.paymentMethod}</td>
			</tr>
			
		</table>
		
		<div>
			<h3>Ordered Books:</h3>
		</div>
	
		<table border="1">
			<tr>
				<th>No</th>
				<th>Book</th>
				<th>Author</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Sub Total</th>
			</tr>
			<c:forEach var="orderDetail" items="${order.orderDetails}" varStatus="status"> 
			<tr>
				<td>${status.index +1}</td>
				<td>
				<img style="vertical-align: middle;"src="data:image/jpg;base64,${orderDetail.book.base64Image }" width="84" height="110" />
				${orderDetail.book.title}
				</td>
				<td>${orderDetail.book.author}</td>
				<td><fmt:formatNumber value="${orderDetail.book.price}" type="currency"/></td>
				<td>${orderDetail.quantity}</td>
				<td><fmt:formatNumber value="${orderDetail.subtotal}" type="currency"/></td>
				
			</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="right">
					<b><i>TOTAL:</i></b>
				</td>
				<td>
					<b>${order.bookCopies}</b>
				</td>
				<td>
					<b><fmt:formatNumber value="${order.total}" type="currency"/></b>
				</td>
			</tr>
			
		</table> 
		
	</div>
	</c:if>
	</div>	
	<br/>
	<jsp:include page="footer.jsp" />
	
</body>
</html>