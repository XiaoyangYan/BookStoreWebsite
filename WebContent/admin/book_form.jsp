<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create New Book</title>
	<link rel="stylesheet" href = "../css/style.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src ="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src ="../js/jquery.validate.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp"/>
	<div>
		<div align="center">
			<h2>
				<c:if test="${book != null}">
					Edit Book
				</c:if>
				<c:if test="${book == null}">
					Create New Book
				</c:if>
			</h2>
		</div>
	</div>
	<div align="center">
		<c:if test="${book != null}">
			<form action="update_book" method="post" id = "bookForm" enctype="multipart/form-data">
			<input type="hidden" name="bookId" value="${book.bookId}"/>
		</c:if>
		<c:if test="${book == null}">
			<form action = "create_book" method="post" id = "bookForm" enctype="multipart/form-data">
		</c:if>
			<table class="form">
				<tr>
					<td align="right">Category:</td>
					<td align="left">
						<select name="category">
							<c:forEach var="category" items = "${listCategory}">
								<c:if test="${category.categoryId eq book.category.categoryId}">
									<option value="${category.categoryId}" selected>
								</c:if>
								<c:if test="${category.categoryId ne book.category.categoryId}">
									<option value="${category.categoryId}" selected>
								</c:if>${category.name}
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">Title:</td>
					<td align="left"><input type="text" id = "title" name="title" size="20" value="${book.title}"/></td>
				</tr>
				<tr>
					<td align="right">Author:</td>
					<td align="left"><input type="text" id = "author" name="author" size="20" value="${book.author}"/></td>
				</tr>
				<tr>
					<td align="right">ISBN:</td>
					<td align="left"><input type="text" id = "isbn" name="isbn" size="20" value="${book.isbn}"/></td>
				</tr>
				<tr>
					<td align="right">Publish Date:</td>
					<td align="left"><input type="text" id = "publishDate" name="publishDate" size="20" 
					value="<fmt:formatDate pattern ='MM/dd/yyyy' value='${book.publishDate}'/>"/></td>
				</tr>
				<tr>
					<td align="right">Book Image:</td>
					<td align="left">
						<input type="file" id = "bookImage" name="bookImage" size="20"/><br/>
						<img id="thumbnail" alt="Image Preview" style="width:10%;margin-top:10px"
							src="data:image/jpg;base64,${book.base64Image}"/>
					</td>
				</tr>
				<tr>
					<td align="right">Price:</td>
					<td align="left"><input type="text" id = "price" name="price" size="20" value="${book.price}"/></td>
				</tr>
				<tr>
					<td align="right">Description:</td>
					<td align="left">
						<textarea rows="5" cols="50" id = "description" name="description">"${book.description}"</textarea>
					</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
						<button onclick="javascript:history.go(-1)">Cancel</button>
					</td>
				</tr>
			</table>
	</div>
	
	<div align="center">
		<h2>Book Administration:</h2>
	</div>
	<jsp:directive.include file="footer.jsp"/>
</body>
	<script type="text/javascript">
	function showImageThumbnail(fileInput){
		var file = fileInput.files[0];
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#thumbnail').attr('src', e.target.result);
		}
	}
	$( function() {
		$("#publishDate").datepicker();
	});
	$(document).ready(function(){
		$("#bookImage").change(function(){
			showImageThumbnail(this);
		});
		$("#bookForm").validate({
			rules: {
				category: "required",
				title: "required",
				author: "required",
				isbn: "required",
				publishDate: "required",
				bookImage: "required",
				price: "required",
				description: "required",
			},
			
			messages: {
				category: "Please enter category name",
				title: "Please enter title",
				author: "Please enter author",
				isbn: "Please enter isbn",
				publishDate: "Please enter publish date",
				bookImage: "Please enter book image files",
				price: "Please enter price of the book",
				description: "Please enter description of book",
			}
		});
	});
	</script>
</html>