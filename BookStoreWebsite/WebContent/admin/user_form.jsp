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
	
<title>
	<c:if test="${user !=null}">
	Edit User
	</c:if>
	
	<c:if test="${user ==null}">
	Create New User
	</c:if>
</title>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>
		<c:if test="${user !=null}">
			Edit User
		</c:if>
		<c:if test="${user ==null}">
			Create New User
		</c:if>
		</h2>	
	</div>

	<div align="center">
		<c:if test="${user !=null}">
			<form action="update_user" method="post" id="userForm">
			<input type="hidden" name="userId" value="${user.userId }">
		</c:if>
		
		<c:if test="${user ==null}">
		<form action="create_user" method="post" id="userForm">
		</c:if>
		
		<table class="form">
			<tr>
				<td align="right">Email:</td>
				<td><input type="email" id="email" name="email" value="${user.email}" size="20" /></td>
			</tr>
			
			<tr>
				<td align="right">Full Name:</td>
				<td><input type="text" name="fullname" size="20" value="${user.fullName}" /></td>
			</tr>
			
			<tr>
				<td align="right">Password:</td>
				<td><input type="password" name="password" size="20" value="${user.password}" /></td>
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
		$("#userForm").validate({
			rules: {
				email: "required",
				fullname: "required",
				password: "required"
			}
		
		});
		
		$("#cancelButton").click(function() {
			history.go(-1);
		});
	});

</script>
</html>