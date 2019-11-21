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
		<c:if test="${not empty message}">
		<h5 style="color: red;">${message}</h5>
		</c:if>
		<br>
		<table class="table table-hover">
			<c:forEach items="${serv}" var="service">
				<tr class="d-flex">
					<td class="col-3"><a href="getService.do?id=${service.id}">
							<img src="${service.logo}" alt="" height="50vh"
							alt="${service.name}">
					</a></td>
					<td class="col-3">${service.monthlyPrice}</td>
					<c:if test="${not empty user }">
						<td class="col-3">
							<form action="addUserService.do">
								<input type="hidden" name="servId"
									value="${service.id}"> <input
									class="btn btn-success btn-sm" type="submit" value="add">
							</form>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>


</body>
</html>