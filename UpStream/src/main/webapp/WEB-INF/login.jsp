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
	<%@ include file="nav.jsp"%>
	<h1 class="header text-center">Log In</h1>
	<form:form action="login.do" class="header" method="POST"
		modelAttribute="user">
		<div class="container text-center">

			<form:label path="username"><b>Username</b></form:label> <form:input type="text"
				placeholder="Enter Username" path="username" required="required"></form:input><br>
			<form:errors path="username">Username or password does not match our system. Please try again or register.</form:errors>
			<form:label path="password"><b>Password</b></form:label> <form:input type="password"
				placeholder="Enter Password" path="password" required="required"></form:input><br>

			<button type="submit">Login</button>

		</div>
		<%-- <c:if test="${Error == not null }">
			<p><strong>Username or password does not match our system. Please try again or register.</strong></p>
			</c:if> --%>
	</form:form>
			<form:form action="register.do" id="register button" class="header"
				method="GET">
				<button type="submit">Register</button>
			</form:form>

</body>
</html>