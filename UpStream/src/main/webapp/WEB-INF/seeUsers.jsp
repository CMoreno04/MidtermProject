<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Center</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="shortcut icon" type="image/jpg" href="css/upstreamlolo.png"/>
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
		<td>Activate / Disable
		
		<!-- Activate / Deactivate -->

		</td>
	</tr>
	<c:forEach items="${userList}" var="user">
	<tr>
		<td>
		<a href="seeUserComments.do?id=${user.id}"> ${user.username} </a>
		</td>
		<td>${user.firstName}</td>
		<td>${user.lastName}</td>
		<td>
	<%-- 	${user.active} --%>
		
		<c:choose>
			<c:when test="${user.active == true}">
				<form action="deleteUserFromAdmin.do" method="GET">
					<input type="hidden" name="userId" value="${user.id}">
					<input type="submit" class="btn btn-success btn-sm" value="Enabled">
				</form>
			</c:when>
			<c:otherwise>
				<form action="enableUserFromAdmin.do" method="GET">
					<input type="hidden" name="userId" value="${user.id}">
					<input type="submit" class="btn btn-warning btn-sm" value="Disabled">
				</form>
			</c:otherwise>
		</c:choose>
		
		</td>
	</tr>
	</c:forEach>
</table>


</div>
<%-- <%@ include file="footer.jsp" %> --%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>