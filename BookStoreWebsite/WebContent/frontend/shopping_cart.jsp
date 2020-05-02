<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
	<style>
     <%@ include file="../css/style.css"%>
	</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
		
<body>
	<jsp:include page="header.jsp" />
	<fmt:setLocale value="en_ZA"/>
	
	<div align="center">
		<h2>Your Cart Details</h2>

		<c:if test="${message !=null}">
			<div align="center">
				<h4 class="message">${message}</h4>
			</div>
		</c:if>
		
		<c:set var="cart" value="${sessionScope['cart']}">
		</c:set>
		
		<c:if test="${cart.totalItems == 0 }">
			<h2>Your cart is currently empty.</h2><br>
			<a href="${pageContext.request.contextPath}/">Continue Shopping</a>
		</c:if>
		
		<c:if test="${cart.totalItems > 0 }">
			
				<form action="update_cart" method="post" id="cartForm">
				<div>
					<table border="1" >
						<tr>
							<th>No</th>
							<th colspan="2">Book</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Subtotal</th>
							<th>
								
							</th>
						</tr>
						
						<c:forEach items="${cart.items}" var="item" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							
							<td valign="top">
								<img src="data:image/jpg;base64,${item.key.base64Image }" width="84" height="110">
							
							</td>
							<td>
								${item.key.title}
							</td>
							
							<td>
								<input type="hidden" name="bookId" value="${item.key.bookId}" />
								<input type="number" name="quantity${status.index + 1}" value="${item.value}" size="5" />
							</td>
							
							<td>
							
								<fmt:formatNumber value="${item.key.price}" type="currency"/>
								</td>
							
							<td>
								<fmt:formatNumber value="${item.value * item.key.price}" type="currency"/>
							</td>
							<td><a href="remove_from_cart?book_id=${item.key.bookId}">Remove</a></td>
						</tr>
						</c:forEach>
						
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><b>${cart.totalQuantity} copies	</b></td>
							<td><b>Total:</b></td>
							<td colspan="2"><b><fmt:formatNumber value="${cart.totalAmount}" type="currency"/></b></td>
						</tr>
					</table>
				</div>
				
				<div>
					<table style="border:0;">
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td></td>
							<td><button type="submit">Update</button></td>
							<td><input type="button" id="clearButton" value="Clear Cart"	 /></td>
							<td><a href="${pageContext.request.contextPath}/">Continue Shopping</a></td>
							<td><a href="checkout">Checkout</a></td>
						</tr>
					</table>
				</div>
				</form>
			
		</c:if>
		
	</div>
	<br>
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#clearButton").click(function() {
			window.location = 'clear_cart';
		});
		
		$("#cartForm").validate({
			rules: {
				<c:forEach items="${cart.items}" var="item" varStatus="status">
				quantity${status.index + 1}: {
					required: true, min:1
				},
				</c:forEach>
			},
			
		
		});
		});
		
	
</script>
</html>