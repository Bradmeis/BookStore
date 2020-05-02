<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Reviews</title>
<style>
     <%@ include file="../css/style.css"%>
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Review Management</h2>
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
				<th>Book</th>
				<th>Rating</th>
				<th>Headline</th>
				<th>Customer</th>
				<th>Review  On</th>
				<th>Actions</th>
			</tr>
			
			<c:forEach var="review" items="${listReviews}" varStatus="status"> 
				<tr>
				<td>${status.index +1}</td>
				<td>${review.reviewId}</td>
				<td>${review.book.title}</td>
				<td>${review.rating}</td>
				<td>${review.headline}</td>
				<td>${review.customer.fullname}</td>
				<td>${review.reviewTime}</td>
				<td>
					<a href="edit_review?id=${review.reviewId}">Edit</a> &nbsp;|&nbsp;
					<a href="javascript:void(0);" class="deleteLink" id="${review.reviewId}">Delete</a>
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
				reviewId = $(this).attr("id");
				if(confirm('Are you sure you want to delete review with ID '+reviewId+'?')){
					window.location = 'delete_review?id='+reviewId;
				}
			});
		});
		
	});
	</script>
</body>
</html>