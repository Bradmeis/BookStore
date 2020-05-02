<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="en_ZA"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Orders</title>
<style>
     <%@ include file="../css/style.css"%>
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Book Orders Management</h2>
	</div>
	
	<c:if test="${message !=null}">
	<div align="center">
		<h3><i><font color="green"> ${message}</font></i></h3>
	</div>
	</c:if>
	<div align="center">
		<table border="1">
			<tr>
				<th>Index</th>
				<th>Order ID</th>
				<th>Ordered by</th>
				<th>Book Copies</th>
				<th>total</th>
				<th>Payment Method</th>
				<th>Status</th>
				<th>Order Date</th>
				<th>Action</th>
			</tr>
			
			<c:forEach var="order" items="${listOrder}" varStatus="status"> 
				<tr>
				<td>${status.index +1}</td>
				<td>${order.orderId}</td>
				<td>${order.customer.fullname}</td>
				<td>${order.bookCopies}</td>
				<td>
					<fmt:formatNumber value="${order.total}" type="currency"/>
				</td>
				<td>${order.paymentMethod}</td>
				<td>${order.status}</td>
				<td>${order.orderDate}</td>
				<td>
					<a href="view_order?id=${order.orderId}">Details</a> &nbsp;|&nbsp;
					<a href="edit_order?id=${order.orderId}">Edit</a> &nbsp;|&nbsp;
					<a href="javascript:void(0);" class="deleteLink" id="${order.orderId}">Delete</a>
				</td>
				<tr/>
			</c:forEach>
			
		</table>
	</div>
	<br/>
	<jsp:include page="footer.jsp" />
	
	<script>
$(document).ready(function(){
		
		$(".deleteLink").each(function(){
			$(this).on("click", function() {
				orderId = $(this).attr("id");
				if(confirm('Are you sure you want to delete order with ID '+orderId+'?')){
					window.location = 'delete_order?id='+orderId;
				}
			});
		});
		
	});
	</script>
</body>
</html>