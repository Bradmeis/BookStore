<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="en_ZA"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Detail</title>
<style>
     <%@ include file="../css/style.css"%>
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Details of Order ID: ${order.orderId}</h2>
		
	</div>
	
	<c:if test="${message !=null}">
	<div align="center">
		<h3><i><font color="green"> ${message}</font></i></h3>
	</div>
	</c:if>
	
	<div align="center">
		
		<h3>Order Overview</h3>
		
		<table border="1">
			<tr>
				<td><b>Ordered By:</b></td>
				<td>${order.customer.fullname}</td>
			</tr>
			
			<tr>
				<td><b>Book Copies:</b></td>
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
			
			<tr>
				<td><b>Order Status:</b></td>
				<td>${order.status}</td>
			</tr>
			
			<tr>
				<td><b>Order Date:</b></td>
				<td>${order.orderDate}</td>
			</tr>	
		</table>
		
		<div>
			<h3>Ordered Books:</h3>
		</div>
	
		<table border="1">
			<tr>
				<th>index</th>
				<th>Book Title</th>
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
		
		<div>
		<br>
			<a href="edit_order?id=${order.orderId}">Edit this order</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="">Delete this order</a>
		</div>
		
	</div>
	
	<br/>
	<jsp:include page="footer.jsp" />
	
	<script>
$(document).ready(function(){
		
		$(".deleteLink").each(function(){
			$(this).on("click", function() {
				reviewId = $(this).attr("id");
				if(confirm('Are you sure you want to delete review with ID '+reviewId+'?')){
					window.location = 'delete_review?id='+reviewId;
				}
			});
		});
		
	});
	</script>
</body>
</html>