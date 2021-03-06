<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<style>
     <%@ include file="../css/style.css"%>
	</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
	
<title>Register as a Customer</title>

<body>
	<jsp:include page="header.jsp" />
	
	<div align="center">
		<h2>Register as a Customer</h2>
	</div>

	<div align="center">
	
		<form action="register_customer" method="post" id="customerForm">
		
		<table class="form">
			<tr>
				<td align="right">E-mail Address:</td>
				<td><input type="email" id="email" name="email" size="45" /></td>
			</tr>
			
			<tr>
				<td align="right">Full Name:</td>
				<td><input type="text" id="fullName" name="fullName" size="45" /></td>
			</tr>
			
			<tr>
				<td align="right">Password:</td>
				<td><input type="password" id="password" name="password" size="45" /></td>
			</tr>
			
			<tr>
				<td align="right">Confirm Password:</td>
				<td><input type="password" id="confirmPassword" name="confirmPassword" size="45" /></td>
			</tr>
			
			<tr>
				<td align="right">Phone Number:</td>
				<td><input type="tel" id="phoneNumber" name="phoneNumber" size="45" /></td>
			</tr>
			
			<tr>
				<td align="right">Address:</td>
				<td><input type="text" id="address" name="address" size="45" /></td>
			</tr>
			
			<tr>
				<td align="right">City:</td>
				<td><input type="text" id="city"  name="city" size="45" /></td>
			</tr>
			
			<tr>
				<td align="right">Zip Code:</td>
				<td><input type="text" id="zipCode" name="zipCode" size="45" /></td>
			</tr>
			
			<tr>
				<td align="right">Country:</td>
				<td><input type="text" id="country" name="country" size="45"  /></td>
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
				fullName: "required",
				password: "required",
				
				confirmPassword: {
					required: true,
					equalTo: "#password"
					
				} ,
		
				phoneNumber: "required",
				address: "required",
				city: "required",
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