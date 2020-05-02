<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Categories</title>
<style>
     <%@ include file="../css/style.css"%>
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Category Management</h2>
		<h3><a href="category_form.jsp" >Create New Category</a></h3>
	</div>
	
	<c:if test="${message !=null}">
	<div align="center">
		<h3><i><font color="green"> ${message}</font></i></h3>
	</div>
	</c:if>
	<div align="center">
		<table border="1" cellpadding="5">
			<tr>
				<th>Index</th>
				<th>ID</th>
				<th>Name</th>
				<th>Actions</th>
			</tr>
			
			<c:forEach var="cat" items="${listCategory}" varStatus="status"> 
				<tr>
				<td>${status.index +1}</td>
				<td>${cat.categoryId}</td>
				<td>${cat.name}</td>
				<td>
					<a href="edit_category?id=${cat.categoryId}">Edit</a> &nbsp;|&nbsp;
					<a href="javascript:void(0);" class="deleteLink" id="${cat.categoryId}">Delete</a>
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
				categoryId = $(this).attr("id");
				if(confirm('Are you sure you want to delete category with ID '+categoryId+'?')){
					window.location = 'delete_category?id='+categoryId;
				}
			});
		});
		
	});
	</script>
</body>
</html>