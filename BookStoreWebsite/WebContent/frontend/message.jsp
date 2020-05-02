<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Evergreen Books - Online Book Store</title>

    <link rel="stylesheet" href="css/style.css"> 
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="center">
		<h3> <font color="red">${message }</font></h3>
		<a href="javascript:history.go(-1);">Go Back</a>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>