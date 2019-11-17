<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${user.username } Profile</title>

<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

</head>
<body>

	<%@ include file="nav.jsp"%>
	<div class="userProfile">
	<h1>${user.username } </h1>
	</div>


<%-- 	<c:forEach items="${userService.username}" var="details" varStatus="loop">
		<div class="container-fluid">
			<div class="card text-white bg-success mb-3"
				style="max-width: 20rem;">
				<div class="card-header">${userService.username }</div>
				<div class="card-body">
					<c:forEach items="${userContent}" var="details" varStatus="loop">
						<p class="card-text">${userContent.title }</p>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:forEach> --%>


	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script> -->
</body>
</html>