<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout - Online Book Store</title>
	<style>
     <%@ include file="../css/style.css"%>
	</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
		
<body>
	<jsp:include page="header.jsp" />
	<fmt:setLocale value="en_ZA"/>
	
	<div align="center">
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
				<div>
					<h2>Review Your Order Details <a href="view_cart">&nbsp;&nbsp;Edit</a></h2>
					<table border="1" >
						<tr>
							<th>No</th>
							<th colspan="2">Book</th>
							<th>Author</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Subtotal</th>
							
						</tr>
						
						<c:forEach items="${cart.items}" var="item" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							
							<td colspan="2">
								<img style="vertical-align: middle;" src="data:image/jpg;base64,${item.key.base64Image }" width="84" height="110">
								${item.key.title}
							</td>
							
							
							
							
							<td>
								${item.key.author}
							</td>
							
							<td>
							
								<fmt:formatNumber value="${item.key.price}" type="currency"/>
							</td>
							
							<td>
								<input type="number" name="quantity${status.index + 1}" value="${item.value}" size="5" readonly="readonly" />
							</td>
							
							
							
							<td>
								<fmt:formatNumber value="${item.value * item.key.price}" type="currency"/>
							</td>
							
						</tr>
						</c:forEach>
						
						<tr>
							<td></td>
							<td colspan="2"></td>
							<td><b>${cart.totalQuantity} copies	</b></td>
							<td><b>Total:</b></td>
							<td colspan="2"><b><fmt:formatNumber value="${cart.totalAmount}" type="currency"/></b></td>
						</tr>
					</table>
				</div>			
		</c:if>
		<br><br>
		<div><b>Your Shipping Information:</b></div>
		<br>
		<form id="orderForm" action="place_order" method="post">
			<table style="border:0;">
				<tr>
					<td><b>Recipient Name:</b></td>
					<td><input type="text" name="recipientName" value="${loggedCustomer.fullname}"/>
					</td>	
					
				</tr>
				
				<tr>
					<td><b>Recipient Phone:</b></td>
					<td><input type="text" name="recipientPhone" value="${loggedCustomer.phone}"/>
					</td>	
				</tr>
				
				<tr>
					<td><b>Street Address:</b></td>
					<td><input type="text" name="recipientAddress" value="${loggedCustomer.address}"/>
					</td>	
				</tr>
				
				<tr>
					<td><b>City:</b></td>
					<td><input type="text" name="city" value="${loggedCustomer.city}"/>
					</td>	
				</tr>
				
				<tr>
					<td><b>Zip Code:</b></td>
					<td><input type="text" name="zipCode" value="${loggedCustomer.zipcode}"/>
					</td>	
				</tr>
				
				<tr>
					<td><b>Country:</b></td>
					<td><input type="text" name="country" value="${loggedCustomer.country}"/>
					</td>	
				</tr>
			</table>
			<br><br>
			<b>Payment:</b>
			<br><br>
			<div>
				Choose your payment method:
				&nbsp;&nbsp;&nbsp;
				<select name="paymentMethod">
					<option value="Cash On Delivery">Cash On Delivery</option>
				</select>
			</div>
			<div>
					<table style="border:0;">
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td></td>
							<td><button type="submit">Place Order</button></td>
							<td><a href="${pageContext.request.contextPath}/">Continue Shopping</a></td>
						
						</tr>
					</table>
				</div>
		</form>
	</div>
	<br>
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
	
$(document).ready(function(){
	
	$("#orderForm").validate({
		rules: {
			recipientName: "required",
			recipientPhone: "required",
			recipientAddress: "required",
			city: "required",
			zipCode: "required",
			country: "required"
		}
		
	
	});
	});
		
	
</script>
</html>