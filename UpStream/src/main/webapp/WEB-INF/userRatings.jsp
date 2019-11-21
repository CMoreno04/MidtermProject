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

<!-- ADMIN CENTER/ ADMIN LIST OF SPECIFIC USER COMMENTS -->

<div class="container" style="margin-top: 30px">
	<h4>Reviews from ${userName.username}</h4>
	<table class="table">
	<c:forEach items="${userRatings}" var="rev" varStatus="loop">
	<tr class="d-flex">
		<td class="col-sm-4">
		<a href="getContents.do?id=${rev.content.id}">${rev.content.title}</a>
		</td>
		<td class="col-sm-4">
		<c:choose>
    			<c:when test="${rev.rating == '1'}">
				⚡
    			</c:when> 
    			<c:when test="${rev.rating == '2'}">
    			⚡⚡
    			</c:when> 
    			<c:when test="${rev.rating == '3'}">
    			⚡⚡⚡
    			</c:when> 
    			<c:when test="${rev.rating == '4'}">
    			⚡⚡⚡⚡
    			</c:when> 
				<c:when test="${rev.rating == '5'}">
				⚡⚡⚡⚡⚡
    			</c:when> 
 			   <c:otherwise> No rating </c:otherwise> 
			</c:choose>
		</td>
		<td class="col-sm-4">${rev.comment}</td>
	</tr>
<!-- update and delete -->
	<tr class="d-flex bg-secondary">
		<td class="col">
			<div class="text-right">
				<div class="text-center" style="display: inline-flex;">
<!-- Submit buttons -->


<!-- DELETE BUTTON -->		
		<form action="deleteReviewFromProfile.do" method="POST">
			<input type="hidden" name="userId" value="${user.id}">
			<input type="hidden" name="contentId" value="${rev.content.id}">
			<input type="hidden" name="revId" value="${rev.id}">
			<input class="btn btn-danger btn-sm" type="submit" value="delete">
		</form>	
	</div>
	</div>
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