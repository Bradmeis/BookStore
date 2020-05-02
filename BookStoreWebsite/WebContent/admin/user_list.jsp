<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Users</title>
<style>
     <%@ include file="../css/style.css"%>
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Users Management</h2>
		<h3><a href="user_form.jsp" >Create New User</a></h3>
	</div>
	
	<c:if test="${message !=null}">
	<div align="center">
		<h4><i><font color="green"> ${message}</font></i></h4>
	</div>
	</c:if>
	<div align="center">
		<table border="1">
			<tr>
				<th>Index</th>
				<th>ID</th>
				<th>Email</th>
				<th>Full Name</th>
				<th>Actions</th>
			</tr>
			
			<c:forEach var="user" items="${listUsers}" varStatus="status"> 
				<tr>
				<td>${status.index +1}</td>
				<td>${user.userId}</td>
				<td>${user.email}</td>
				<td>${user.fullName}</td>
				<td>
					<a href="edit_user?id=${user.userId}">Edit</a> &nbsp;|&nbsp;
					<a href="javascript:void(0);" class="deleteLink" id="${user.userId}">Delete</a>
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
				userId = $(this).attr("id");
				if(confirm('Are you sure you want to delete user with ID '+userId+'?')){
					window.location = 'delete_user?id='+userId;
				}
			});
		});
		
	});
		
	</script>
</body>
</html>