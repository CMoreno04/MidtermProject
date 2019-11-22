<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Up-Stream</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="shortcut icon" type="image/jpg" href="css/upstreamlolo.png"/>
</head>
<body>

	<%@ include file="nav.jsp"%>
	<div class="container">
		<br>
		<h4>Services</h4>
		<c:if test="${not empty message}">
		<h5 style="color: red;">${message}</h5>
		</c:if>
		<br>
		<table class="table table-hover">
			<c:forEach items="${serv}" var="service">
				<tr class="d-flex">
					<td class="col"><a href="getService.do?id=${service.id}">
							<img src="${service.logo}" alt="" height="50vh"
							alt="${service.name}">
					</a></td>
					<td class="col">${service.monthlyPrice}</td>
					<c:if test="${not empty user }">
						<td class="col">
							<form action="addUserService.do">
								<input type="hidden" name="servId"
									value="${service.id}"> <input
									class="btn btn-success btn-sm" type="submit" value="Add Service">
							</form>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>

<%-- <%@ include file="footer.jsp" %> --%>
</body>
</html>