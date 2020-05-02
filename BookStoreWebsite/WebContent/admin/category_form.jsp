<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>
	<c:if test="${category !=null}">
	Edit Category
	</c:if>
	
	<c:if test="${category ==null}">
	Create New Category
	</c:if>
</title>
	<style>
     <%@ include file="../css/style.css"%>
	</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>
		<c:if test="${category !=null}">
			Edit Category
		</c:if>
		<c:if test="${category ==null}">
			Create New Category
		</c:if>
		</h2>	
	</div>

	<div align="center">
		<c:if test="${category !=null}">
			<form action="update_category" method="post" id="categoryForm">
			<input type="hidden" name="categoryId" value="${category.categoryId }">
		</c:if>
		
		<c:if test="${category ==null}">
		<form action="create_category" method="post" id="categoryForm">
		</c:if>
		
		<table class="form">
			<tr>
				<td align="right">Name:</td>
				<td><input type="text" id="name" name="name" value="${category.name}" size="20" />
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
		$("#categoryForm").validate({
			rules: {
				name: "required"
			}
		
		});
		
		$("#cancelButton").click(function() {
			history.go(-1);
		});
	});

</script>
</html>