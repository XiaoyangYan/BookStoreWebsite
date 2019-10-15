<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin Login</title>
	<link rel="stylesheet" href = "../css/style.css">
	<script type="text/javascript" src ="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src ="../js/jquery.validate.min.js"></script>
</head>
<body>
	<div align="center">
		<h1>Book Store Administration</h1>
		<h2>Admin Login</h2>
	</div>
	<c:if test="${message != null}">
		<div align="center">
			<h4 class="message">${messege}</h4>
		</div>
	</c:if>
	<form id = "loginForm" action="login" method="post">
		<table align="center">
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" size="20"/></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="text" name="password" size="20"/></td>
			</tr>
			<tr>
				<td colspan = "2" align="center">
					<button type="submit">Login</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	
		$(document).ready(function(){
			$("#loginForm").validate({
				rules: {
					email: {
						required: true,
						email: true
					},
					fullname: "required",
					password: "required",
				},
				
				messages: {
					email: {
						required: "Please enter email",
						email: "Please enter a valid email address"
					},
					fullname: "Please enter full name",
					password: "Please enter password",
				}
			});
			

			$("#CancelButton").click(function(){
				history.go(-1);
			});
		});
		
	</script>
</html>