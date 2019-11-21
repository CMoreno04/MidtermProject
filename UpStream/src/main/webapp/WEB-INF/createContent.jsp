<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Content</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<%@ include file="nav.jsp"%>
	<br>
	
	<form action="createContent.do" method="POST">
	<div class="form-row center">
					Title: <input type="text" name ="title" required="required"/><br>
					Description: <input type="text" name ="description" required="required"/><br>
 					Stream Service: 
 					<select name="service">
						<c:forEach items="${serviceList}" var="service">
							<option value="${service.id}">${service.name}</option>
						</c:forEach>
					</select> 
					Image: <input type="number" name ="image" /><br>
					Video: <input type="number" name ="video" /><br>
 					<select name="genres">
						<c:forEach items="${genreList}" var="genres">
						
						<input type="checkbox" name="genre" value="${genres.id }" checked> ${genres.name }<br>
<%-- 							<option value="${genres.id }">${genres.name }</option>
 --%>						</c:forEach>
					</select> 
			
				<input class="btn btn-submit" type="submit" value="Add Content"/> 
	</div></form>

</body>
</html>