<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Results for ${keyword} - Online Books Store</title>
<link rel="stylesheet" href="css/style.css"> 
</head>
<body >

	<jsp:include page="header.jsp"></jsp:include>
	<div class="center">
		<h2>${category.name}</h2>
	</div>
	
	<div class="center" >
		<c:if test="${fn:length(result) == 0 }">
			<h2>No Results found for "${keyword}"</h2>
		</c:if>
	
		<c:if test="${fn:length(result) > 0 }">
		
			<div style="width:90%; margin: 0 auto;">
				<h2>Results for "${keyword}":</h2>
				
				<c:forEach items="${result}" var="book">
					<div>
					<div style="display:inline-block; margin:20px; width:10%;">
						<div >
							<a href="view_book?id=${book.bookId}"> 
							<img class="book-small"
								src="data:image/jpg;base64,${book.base64Image }" />
							</a>
						</div>
					</div>
						<div style="display: inline-block; margin: 10px; width:50%; 
									vertical-align:top; padding-left:80px;
										text-align:left;" >
							<div>
								<h2><a href="view_book?id=${book.bookId}"> <b>${book.title}</b></a></h2>
							</div>
							<div>
								<jsp:directive.include file="book_rating.jsp" />
							</div>
							<div>
								<i>by ${book.author}</i>
						</div>
							<div>
								<p>${fn:substring(book.description, 0, 100)}...</p>
							</div>
						</div>
						<div id="search-price">
						<h3>R${book.price}</h3>
						<h3><a href="add_to_cart?book_id=${book.bookId}">Add To Cart</a></h3>
					</div>
					</div>
					
				</c:forEach>
			</div>
		</c:if>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>



</body>
</html>