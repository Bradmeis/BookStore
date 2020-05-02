<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
	<style>
     <%@ include file="../css/style.css"%>
	</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
	
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Customer Login</h2>

		<c:if test="${message !=null}">
			<div align="center">
				<h4 class="message">${message}</h4>
			</div>
		</c:if>

		<form action="login" method="post" id="loginForm">
	
		<table>
			<tr>
				<td align="right">Email:</td>
				<td><input type="email" id="email" name="email" value="${user.email}" size="20" /></td>
			</tr>
			
			<tr>
				<td align="right">Password:</td>
				<td><input type="password" name="password" size="20" value="${user.password}" /></td>
			</tr>
		
			<tr>
				<td colspan="2" align="center">
					<button type="submit" >Login</button>
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
		$("#loginForm").validate({
			rules: {
				email: "required",
				password: "required"
			}
		
		});
		});
		
	
</script>
</html>