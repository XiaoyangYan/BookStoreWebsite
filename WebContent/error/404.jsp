<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page Not Found Error</title>
</head>
<body>
	<div>
		<img src="${pageContext.request.contextPath}/images/BookstoreAdminLogo.png"/>
	</div>
	<div align="center">
		<h2>Sorry, the requested page could not be found</h2>
		<h3>Please check back later.</h3>
	</div>
	<div>
		<a href="javascript:history.go(-1);">Go Back</a>
	</div>
</body>
</html>