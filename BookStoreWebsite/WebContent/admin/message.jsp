<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
<link rel="stylesheet" href="../css/style.css"> 
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div align="center">
		<h3> <font color="red">${message }</font></h3>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>