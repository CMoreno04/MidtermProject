<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Content</title>

<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
	<%@ include file="nav.jsp"%>
	<br>
	
	<form action="addContent.do" method="POST">
	<div class="form-row center">
					Title: <input type="text" name ="title" required="required"/><br>
					Description: <input type="text" name ="description" required="required"/><br>
					Image: <input type="text" name ="image" /><br>
					Video: <input type="text" name ="video" /><br>
					Genre: <input type="text" name ="genres" /><br>
					Stream Service: <input type="text" name ="service" /><br>
					Rating Reviews: <input type="text" name ="ratingReviews" /><br>
					<input class="btn btn-submit" type="submit" value="Add Buffet" />
	</form>"
	</div>
</body>
</html>