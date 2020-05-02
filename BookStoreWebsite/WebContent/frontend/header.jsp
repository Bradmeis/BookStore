<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="css/style.css">
<div class="center" style="background-color: 	#008080; " >
	<div>
		<a href="${pageContext.request.contextPath }"><img
			src="images/logo.png" /></a>
	</div>

	<div>
		<form action="search" method="get">
			<input type="text" name="keyword" size="50"> 
			<input type="submit" value="Search"> 
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			<c:if test="${loggedCustomer == null}">
			<a href="login">Sign In</a> | 
			<a href="register">Register</a> |
			</c:if>
			
			<c:if test="${loggedCustomer != null}">
			<a href="view_profile">Welcome, ${loggedCustomer.fullname}</a> | 
			<a href="view_orders">My Orders</a> |
			<a href="logout">Logout</a> | 	
			</c:if>
			<a href="view_cart">Cart</a>
			

		</form>
	</div>
	<div>&nbsp;</div>
	<div>
		<c:forEach var="category" items="${listCategory}" varStatus="status">
			<a href="view_category?id=${category.categoryId }"> <b>${category.name}</b>
			</a>
			<c:if test="${not status.last }">
			&nbsp; | &nbsp;
			</c:if>
		</c:forEach>

	</div>
</div>