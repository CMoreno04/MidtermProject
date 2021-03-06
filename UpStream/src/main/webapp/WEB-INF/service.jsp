<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/form" prefix="form"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subscription Services</title>

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="shortcut icon" type="image/jpg" href="css/upstreamlolo.png"/>

</head>
<body>

	<%@ include file="nav.jsp"%>
	<%-- <h2>${serviceName.name}</h2> --%>

	<br>
	<!-- 	<div class="titlebox text-center"> -->
	<div class="container">
		<img src="${serviceName.logo}" height="50vh" alt="${serviceName.name}">
	</div>
	<br>



	<%-- 		<c:forEach items="${content}" var="details" varStatus="loop" begin="${serv.id -1}" end="${serv.id-1}">

 --%>
	<div class="container">
		<c:if test="${not empty message}">
			<h5 style="color: red;">${message}</h5>
		</c:if>
		<table class="table table-hover">
			<tr class="d-flex">


				<th scope="col" class="col-6">Title</th>
				<th scope="col" class="col-3">Rating</th>
				
				<th scope="col" class="col-3">
				<c:if test="${not empty user}"> Add
				</c:if></th>

				<c:forEach items="${content}" var="indivContent" varStatus="loop2">
					<tr class="d-flex">
						<td class="col-6"><a
							href="getContents.do?id=${indivContent.id}">${indivContent.title}<br></a>
						</td>
						<td class="col-3"><c:forEach items="${rating}" var="rat"
								varStatus="loop" begin="${loop2.index}" end="${loop2.index}">

								<c:choose>
									<c:when test="${rat <= '1'}">
                ⚡
                </c:when>
									<c:when test="${rat <= '2.5'}">
                ⚡⚡
                </c:when>
									<c:when test="${rat <= '3.5'}">
                ⚡⚡⚡
                </c:when>
									<c:when test="${rat <= '4.5'}">
                ⚡⚡⚡⚡
                </c:when>
									<c:when test="${rat <= '5'}">
                ⚡⚡⚡⚡⚡
                </c:when>
									<c:otherwise> ${rat} </c:otherwise>
								</c:choose>

							</c:forEach></td>

						<td class="col-3"><c:if test="${not empty user }">

								<form action="addContentToProfile.do">
									<input type="hidden" name="userId" value="${user.id}" /> <input
										type="hidden" name="serviceId" value="${serviceName.id}" /> <input
										type="hidden" name="contentId" value="${indivContent.id}" />
									<button type="submit" class="btn btn-success">Add to My List</button>
								</form>

							</c:if>
					</tr>


				</c:forEach>
		</table>
	</div>
	<%-- 		</c:forEach> --%>


<%-- <%@ include file="footer.jsp" %> --%>
</body>
</html>