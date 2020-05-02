
<c:forTokens items="${book.ratingStars}" delims="," var="star">
							
								<c:if test="${star eq 'on' }">
									<img src="images/on.png">
								</c:if>
								
								<c:if test="${star eq 'off' }">
									<img src="images/off.png">
								</c:if>
							
								<c:if test="${star eq 'half' }">
									<img src="images/half.png">
								</c:if>
</c:forTokens>