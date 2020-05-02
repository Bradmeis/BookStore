<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Write Review - Online Book Store</title>
	<style>
     <%@ include file="../css/style.css"%>
	</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<body>
	<jsp:include page="header.jsp" />
	
	<div align="center">
		<form id="reviewForm">
			<table style=" border:0; width:80%;">
				<tr>
					<td><h3>You already wrote a review for this book</h3></td>
					<td>&nbsp;</td>
					<td><h2>${loggedCustomer.fullname}</h2></td>
				</tr>
				
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				
				<tr>	
					<td>
						<span id="book-title" >${book.title}</span><br><br>
						<img class="book-large" src="data:image/jpg;base64,${book.base64Image }" >
					</td>
					
					<td>
						 <div id="rateYo"></div>
						 <br>
						 <br>
						<input type ="text" name="headline" size="60" readonly="readonly" value="${review.headline}"/>
						<br><br>
						<textarea name ="comment" rows="10" cols="70" readonly="readonly" >${review.comment}</textarea>
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

		 $("#rateYo").rateYo({
			    startWidth: "40px",
			    fullStar: true,
			    rating: ${review.rating},
			    readOnly: true
			  });
		 
	});
		
	
</script>
</html>