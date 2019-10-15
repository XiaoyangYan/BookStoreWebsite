<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Categories - Evergreen Books Administration</title>
	<link rel="stylesheet" href = "../css/style.css">
	<script type="text/javascript" src ="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src ="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
		<h2 class="pageheading">Category Management</h2>
		<a href="new_book">Create New Book</a>
	</div>
	<c:if test="${message != null}">
	<div align="center">
		<h4 class="message">${messege}</h4>
	</div>
	</c:if>
	<div align="center">
		<table class="from">
			<tr>
				<th>Index</th>
				<th>ID</th>
				<th>Image</th>
				<th>Title</th>
				<th>Author</th>
				<th>Category</th>
				<th>Price</th>
				<th>Last Updated</th>
				<th>Action</th>
			</tr>
			<c:forEach var="book" items="${listBook}" varStatus="status">
			<tr>
				<td>${status.index+1}</td>
				<td>${book.bookId}</td>
				<td>
					<img src="data:image.jpg;base64,${book.base64Image}" width="84",height="110"/>
				</td>
				<td>${book.title}</td>
				<td>${book.author}</td>
				<td>${book.category.name}</td>
				<td>$${book.price}</td>
				<td><fmt:formatDate pattern ='MM/dd/yyyy' value='${book.lastUpdateTime}'/></td>
				<td>
					<a href="edit_book?bookId=${book.bookId}">Edit</a>
					<a href="javascript:void(0);" class="deletelink" id = "${book.bookId}">Delete</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<div align="center">
		<hr width = 60% />
		<h2>Statistics:</h2>
		<hr width = 60% />
	</div>
	<jsp:directive.include file="footer.jsp"/>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$(".deletelink").each(function(){
			$(this).on("click", function(){
				bookId = $(this).attr("id");
				if (confirm("Are you sure you want to delete the book with ID "+bookId+"?")){
					window.location = 'delete_book?id='+bookId;
				}
			})
		});
	});
</script>
</html>