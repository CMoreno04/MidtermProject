<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Up-Stream</title>
</head>
<body>

	<%@ include file="nav.jsp"%>
	<div class="container">
		<br>
		<h4>Services</h4>
		<br>
		<table class="table table-hover">
			<c:forEach items="${serv}" var="service">
				<tr class="d-flex">
					<td class="col-3"><a href="getService.do?id=${service.id}">${service.name}</a>
						<img src="${service.logo}" alt="" width="250" height="150" /></td>
					<td class="col-3">${service.monthlyPrice}</td>

					<c:if test="${not empty user }">
						<td class="col-3">
							<form action="addUserService.do">
							<input type="hidden" name="userId" value="${user.id}">
							<input type="hidden" name="servId" value="${serv.id}">
								<button type="submit" class="btn btn-success">add</button>
							</form>
						</td>
					</c:if>
					
					
				</tr>
			</c:forEach>
		</table>
	</div>


</body>
</html>