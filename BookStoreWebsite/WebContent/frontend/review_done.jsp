<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review Posted- Online Book Store</title>
	<style>
     <%@ include file="../css/style.css"%>
	</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<body>
	<jsp:include page="header.jsp" />
	
	<div align="center">
		
			<table style=" border:0; width:80%;">
				<tr>
					<td><h2>Your Reviews</h2></td>
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
						 <h3>Your Review has been posted. Thank you.</h3>
					</td>
				</tr>
				
			</table>
	
	</div>
	
	<br>
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		 $("#rateYo").rateYo({
			    startWidth: "40px",
			    fullStar: true,
			    onSet: function (rating, rateYoInstance) {
			    	$("#rating").val(rating);
			    }
			  });
		 
	});
		
	
</script>
</html>