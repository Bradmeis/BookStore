<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Books</title>
<link rel="stylesheet" href="../css/style.css"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Books Management</h2>
		<h3><a href="new_book" >Create New Book</a></h3>
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
				<th>Image</th>
				<th>Title</th>
				<th>Author</th>
				<th>Category</th>
				<th>Price</th>
				<th>Last Updated</th>
				<th>Action</th>
			</tr>
			
			<c:forEach var="book" items="${listBooks}" varStatus="status"> 
				<tr>
				<td>${status.index +1}</td>
				<td>${book.bookId}</td>
				<td>
					<img src="data:image/jpg;base64,${book.base64Image }" width="84" height="110">
				</td>
				<td>${book.title}</td>
				<td>${book.author}</td>
				<td>${book.category.name}</td>
				<td>R${book.price}</td>
				<td><fmt:formatDate pattern="MM/dd/yyyy" value="${book.lastUpdateTime}" /></td>
				<td>
					<a href="edit_book?id=${book.bookId}">Edit</a> &nbsp;|&nbsp;
					<a href="javascript:void(0);" class="deleteLink" id="${book.bookId}">Delete</a>
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
				bookId = $(this).attr("id");
				if(confirm('Are you sure you want to delete book with ID '+bookId+'?')){
					window.location = 'delete_book?id='+bookId;
				}
			});
		});
		
	});
		
	</script>
</body>
</html>