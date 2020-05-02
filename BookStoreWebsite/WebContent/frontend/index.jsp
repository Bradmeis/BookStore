<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Evergreen Books - Online Books Store</title>
<link rel="stylesheet" href="css/style.css"> 
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="center">
		<h2>${category.name}</h2>
	</div>
	
	<div class="center">
			<div class="book-group">
			<h2>New Books</h2>
				<c:forEach items="${listNewBooks }" var="book">
				
				<jsp:directive.include file="book_group.jsp" />

				</c:forEach>
			</div>
			<br>
			
			<div class="next-row">
			<h2>Best-Selling Books</h2>
			<c:forEach items="${listBestSellingBooks}" var="book">
			
					<jsp:directive.include file="book_group.jsp" />
					
				</c:forEach>
			</div>
			
			<br>
			
			<div class="next-row">
			<h2>Most-Selling Books</h2>
			<c:forEach items="${listFavoredBooks}" var="book">
					
					<jsp:directive.include file="book_group.jsp" />
					
				</c:forEach>
			</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>



</body>
</html>