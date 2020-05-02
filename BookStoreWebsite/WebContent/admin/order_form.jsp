<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="en_ZA"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Order</title>
<style>
     <%@ include file="../css/style.css"%>
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Edit Order ID: ${order.orderId}</h2>
		
	</div>
	
	<c:if test="${message !=null}">
	<div align="center">
		<h3><i><font color="green"> ${message}</font></i></h3>
	</div>
	</c:if>
	
	<div align="center">
		
		<form action="update_order" method="post" id="orderForm">
		<table style="border: 0;">
			<tr>
				<td><b>Ordered By:</b></td>
				<td>${order.customer.fullname}</td>
			</tr>
			
			<tr>
				<td><b>Order Date:</b></td>
				<td>${order.orderDate}</td>
			</tr>
			
			<tr>
				<td><b>Recipient Name:</b></td>
				<td><input type ="text" name="recipientName" value ="${order.recipientName}" size="45"/></td>
			</tr>
			
			
			
			<tr>
				<td><b>Recipient Phone:</b></td>
				<td><input type="tel" name="phoneNumber" value ="${order.recipientPhone}" size="45"/></td>
			</tr>
			
			<tr>
				<td><b>Ship To:</b></td>
				<td><input type ="text" name="shippingAddress" value ="${order.shippingAddress} " size="45"/></td>
			</tr>
			
			<tr>
				<td><b>Payment Method:</b></td>
				<td>
				<select name="paymentMethod">
					<option value="Cash On Delivery">Cash On Delivery</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td><b>Order Status:</b></td>
				<td>
					<select name="orderStatus">
						<option value="Processing" <c:if test="${order.status eq 'Processing'}">selected='selected'</c:if> >Processing</option>
						<option value="Shipping" <c:if test="${order.status eq 'Shipping'}">selected='selected'</c:if> >Shipping</option>
						<option value="Delivered" <c:if test="${order.status eq 'Delivered'}">selected='selected'</c:if>  >Delivered</option>
						<option value="Completed" <c:if test="${order.status eq 'Completed'}">selected='selected'</c:if>  >Completed</option>
						<option value="Cancelled" <c:if test="${order.status eq 'Cancelled'}">selected='selected'</c:if>  >Cancelled</option>
					</select>
				</td>
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
				<th></th>
			</tr>
			<c:forEach var="orderDetail" items="${order.orderDetails}" varStatus="status"> 
			<tr>
				<td>${status.index +1}</td>
				<td>
					
					${orderDetail.book.title}
				</td>
				<td>${orderDetail.book.author}</td>
				<td>
					<input type="hidden" name="price" value="${orderDetail.book.price}" />
					<fmt:formatNumber value="${orderDetail.book.price}" type="currency"/>
				</td>
				<td>
					<input type="hidden" name="bookId" value="${orderDetail.book.bookId}" />
					<input type="number" name="quantity${status.index + 1}" value="${orderDetail.quantity}" size="5" />
				</td>
				<td><fmt:formatNumber value="${orderDetail.subtotal}" type="currency"/></td>
				<td><a href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a></td>
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
				<td></td>
			</tr>
			
		</table>
		
		<div>
		<br>
			<a href="javascript:showAddBookPopup()"><b>Add Books</b></a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="Save"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="Cancel" onclick="javascript: window.location.href='list_order';"/>
		</div>
		</form>
	</div>
	
	<br/>
	<jsp:include page="footer.jsp" />
	
	<script>
		function showAddBookPopup() {
			var width = 600;
			var height = 250;
			var left = (screen.width - width) / 2;
			var top = (screen.height - height) / 2;
			window.open('add_book_form', '_blank', 'width='+width+', height='+height+', top='+top+', left='+left);
		}
		
		$(document).ready(function(){
			$("#orderForm").validate({
				rules: {
					recipientName: "required",
					phoneNumber: "required",
					shippingAddress: "required",
					
					<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
					quantity${status.index + 1}: {
					required: true, min:1
					},
					</c:forEach>
				}
			
			});
			
			$("#cancelButton").click(function() {
				history.go(-1);
			});
		});
	</script>
</body>
</html>