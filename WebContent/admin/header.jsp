<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<div>
		<img src="../images/BookstoreAdminLogo.png"/>
	</div>
	<div>
		Welcome, <c:out value="${sessionScope.useremail}"/>| <a href="logout">Logout</a>
	</div>
	<div id = "headermenu">
		<div>
			<a href="list_users">
				<img src="../images/user.png" style="height:100px; width:100px"/><br/>Users
			</a>
		</div>
		<div>
			<a href="list_category">
				<img src="../images/category.png" style="height:100px; width:100px"/><br/>Categories 
			</a>
		</div>
		<div>
			<a href="list_books">
				<img src="../images/book.jpg" style="height:100px; width:100px"/><br/>Books
			</a>
		</div>
		<div>
			<a href="customers">
				<img src="../images/customer.png" style="height:100px; width:100px"/><br/> Customers
			</a>
		</div>
		<div>
			<a href="reviews">
				<img src="../images/review.png" style="height:100px; width:100px"/><br/>Reviews
			</a>
		</div >
		<div style="display:table-cell; padding-right: 20px">
			<a href="orders">
				<img src="../images/order.png" style="height:100px; width:100px"/><br/>Orders
			</a>
		</div>
		
	</div>
</div>