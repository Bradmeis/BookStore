<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book To Order</title>
</head>
<body>
	<div align="center">
		<h2>Add Book To Order ID: ${order.orderId}</h2>
		<form action="add_book_to_order" method="post">
			<table>
				<tr>
					<td><b>Select a Book:</b></td>
					<td>
						<select name="bookId">
							<c:forEach items="${listBooks}" var="book" varStatus="status">
								<option value="${book.bookId }">${book.title} - ${book.author}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td><b>Number of Copies:</b></td>
					<td>
						<select name="quantity">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
			</table>
			<br>
			<input type="submit" value="Add" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input  type="button" value="Cancel" onclick="javascript: self.close();"/>
		</form>
	</div>
</body>
</html>