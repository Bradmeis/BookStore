<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books in ${category.name} - Online Books Store</title>
<link rel="stylesheet" href="css/style.css"> 
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="center">
		<h2>${category.name}</h2>
	</div>
	
	<div class="book-group">
		<c:forEach items="${listBooks }" var="book">
			<div class="book" >
				<div>
					<a href="view_book?id=${book.bookId}">
					<img class = "book-small"
					src="data:image/jpg;base64,${book.base64Image }" >
					</a>
				</div>
				<div>
					<a href="view_book?id=${book.bookId}">
						<b>${book.title}</b>
					</a>
				</div>
				<div>
					<jsp:directive.include file="book_rating.jsp" />
				</div>
				<div><i>by ${book.author}</i></div>
				<div><b>R${book.price}</b></div>
			</div>
			
		</c:forEach>
	</div>
	<br><br>
	<jsp:include page="footer.jsp"></jsp:include>
		
	
	 	
</body>
</html>