<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Category</title>
	<style>
     <%@ include file="../css/style.css"%>
	</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div align="center">
		<h2>Edit Review</h2>	
	</div>

	<div align="center">

			<form action="update_review" method="post" id="reviewForm">
			<input type="hidden" name="reviewId" value="${review.reviewId }">
		
		<table style="border:0;">
		
			<tr>
				<td align="right">Book:</td>
				<td align="left"> <b>${review.book.title}</b></td>
			</tr>
			
			<tr>
				<td align="right">Rating:</td>
				<td align="left"> <b>${review.rating}</b></td>
			</tr>
			
			<tr>
				<td align="right">Customer:</td>
				<td align="left"> <b>${review.customer.fullname}</b></td>
			</tr>
			
			<tr>
				<td align="right">Headline:</td>
				<td>
					<input type="text" id="headline" name="headline" size="50" value="${review.headline}">
				</td>
			</tr>
			
			<tr>
				<td align="right">Comment:</td>
				<td>
					<textarea rows="5" cols="70" name ="comment">${review.comment}</textarea>
				</td>
			</tr>
			
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" >Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="Cancel" id="cancelButton	"/>
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
		$("#reviewForm").validate({
			rules: {
				headline: "required",
				comment: "required"
			},
			
			messages: {
				headline: "Please enter the headline",
				comment: "Please enter the comment"
			}
			
		
		});
		
		$("#cancelButton").click(function() {
			history.go(-1);
		});
	});

</script>
</html>