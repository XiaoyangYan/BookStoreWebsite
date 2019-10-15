<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<div>
		<img src="images/BookstoreLogo.png"/>
	</div>
	
	<div>
		<input type="text" name = "keyword" size="50" />
		<input type="button" value="Search"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="login">Sign In</a>
		<a href="register">Register</a>
		<a href="view_cart">Cart</a>
	</div>
	<div>&nbsp;</div>
	<div>
		<c:forEach	var = "category" items = "${listCategory}">
			<a href = "">
				<font size="+1"><b><c:out value = "${category.name}"/></b></font>
			</a>
			&nbsp; | &nbsp;
		</c:forEach>
	</div>
</div>