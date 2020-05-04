<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
            "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<style>
     <%@ include file="../css/style.css"%>
	</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
	
<title>
	<c:if test="${customer !=null}">
	Edit Customer
	</c:if>
	
	<c:if test="${customer ==null}">
	Create New Customer
	</c:if>
</title>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>
		<c:if test="${customer !=null}">
			Edit Customer
		</c:if>
		<c:if test="${customer ==null}">
			Create New Customer
		</c:if>
		</h2>	
	</div>

	<div align="center">
		<c:if test="${customer !=null}">
			<form action="update_customer" method="post" id="customerForm">
			<input type="hidden" name="customerId" value="${customer.customerId }">
		</c:if>
		
		<c:if test="${customer ==null}">
		<form action="create_customer" method="post" id="customerForm">
		</c:if>
		
		<table class="form">
			<tr>
				<td align="right">E-mail Address:</td>
				<td><input type="email" id="email" name="email" value="${customer.email}" size="45" /></td>
			</tr>
			
			<tr>
				<td align="right">First Name:</td>
				<td><input type="text" id="firstName" name="firstName" size="45" value="${customer.firstname}" /></td>
			</tr>
			
			<tr>
				<td align="right">Last Name:</td>
				<td><input type="text" id="lastName" name="lastName" size="45" value="${customer.lastname}" /></td>
			</tr>
			
			<tr>
				<td align="right">Password:</td>
				<td><input type="password" id="password" name="password" size="45" value="${customer.password}" /></td>
			</tr>
			
			<tr>
				<td align="right">Confirm Password:</td>
				<td><input type="password" id="confirmPassword" name="confirmPassword" size="45" value="${customer.password}" /></td>
			</tr>
			
			<tr>
				<td align="right">Phone Number:</td>
				<td><input type="tel" id="phoneNumber" name="phoneNumber" size="45" value="${customer.phone}" /></td>
			</tr>
			
			<tr>
				<td align="right">Address Line1:</td>
				<td><input type="text" id="addressLine1" name="addressLine1" size="45" value="${customer.addressLine1}" /></td>
			</tr>
			
			<tr>
				<td align="right">Address Line2:</td>
				<td><input type="text" id="addressLine2" name="addressLine2" size="45" value="${customer.addressLine2}" /></td>
			</tr>
			
			<tr>
				<td align="right">City:</td>
				<td><input type="text" id="city"  name="city" size="45" value="${customer.city}" /></td>
			</tr>
			
			<tr>
				<td align="right">Province:</td>
				<td><input type="text" id="province"  name="province" size="45" value="${customer.province}" /></td>
			</tr>
			
			<tr>
				<td align="right">Zip Code:</td>
				<td><input type="text" id="zipCode" name="zipCode" size="45" value="${customer.zipcode}" /></td>
			</tr>
			
			<tr>
				<td align="right">Country:</td>
				<td align="left">
				<select name="country" id="country">
						<c:forEach items="${mapCountries}" var="country">
							<option value="${country.value}">${country.key}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" >Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="cancelButton">Cancel </button>
				</td>	
			</tr>
		</table>
		</form>
	</div>
	<br>
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#customerForm").validate({
			rules: {
				email: "required",
				firstName: "required",
				lastName: "required",
				password: "required",
				
				confirmPassword: {
					required: true,
					equalTo: "#password"
					
				} ,
		
				phoneNumber: "required",
				addressLine1: "required",
				addressLine2: "required",
				city: "required",
				province: "required",
				country: "required",
				zipCode: "required",
			},
			
			messages: {
				
				confirmPassword: {
					equalTo: "password does not match"
				}
			}
			
		});
		
		$("#cancelButton").click(function() {
			history.go(-1);
		});
	});

</script>
</html>