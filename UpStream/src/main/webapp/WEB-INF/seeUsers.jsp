<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Center</title>
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="nav.jsp" %>

<!-- ADMIN CENTER/ ADMIN LIST OF USERS -->

<div class="container" style="margin-top: 30px">

<table class="table bg-secondary table-hover table-striped">
	<tr style="background-color: #000">
		<td><h6>Username</h6></td>
		<td>First name</td>
		<td>Last name</td>
		<td>Activate / Deactivate</td>
	</tr>
	<c:forEach items="${userList}" var="user">
	<tr>
		<td>
		<a href="seeUserComments.do?id=${user.id}"> ${user.username} </a>
		</td>
		<td>${user.firstName}</td>
		<td>${user.lastName}</td>
		<td>${user.active}</td>
	</tr>
	</c:forEach>
</table>



</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>