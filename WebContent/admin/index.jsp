<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta content = "text/html" charset="UTF-8">
	<title>Evergreen Books - Administration</title>
	<link rel="stylesheet" href = "../css/style.css">
	<link rel="stylesheet" href ="../css/jquery-ui.min.css">
	<script type="text/javascript" src ="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src ="../js/jquery.validate.min.js"></script>
	<script type="text/javascript" src ="../js/jquery-ui.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp"/>
	<div align="center">
		<hr/>
		<h2> Quick Actions:</h2>
		<b>
		<a href="book_form.jsp">New Book</a> &nbsp;
		<a href="user_form.jsp">New User</a> &nbsp;
		<a href="category_form.jsp">New Category</a> &nbsp;
		<a href="create_customer">New Customer</a>
		</b>
	</div>
	
	<div align="center">
		<hr width = 60% />
		<h2 class="pageheading">Recent Sales:</h2>
	</div>
	
	<div align="center">
		<hr width = 60% />
		<h2 class="pageheading">Recent Reviews:</h2>
	</div>
	
	<div align="center">
		<hr width = 60% />
		<h2 class="pageheading">Statistics:</h2>
		<hr width = 60% />
	</div>
	<jsp:directive.include file="footer.jsp"/>
</body>
</html>