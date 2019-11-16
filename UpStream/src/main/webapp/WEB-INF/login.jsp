<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>
<body>

	<h1 class="header">Log In</h1>
	<form:form action="login.do" class="header" method="POST" modelAttribute="user">
		<div class="container">
		
			<label for="uname"><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="uname" required><br>
			<label for="psw"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="psw" required> <br>
	
			<button type="submit">Login</button>

		</div>
	</form:form>
</body>
</html>