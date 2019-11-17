<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Up-Stream</title>
</head>
<body>

<%@ include file="nav.jsp" %>
  <div class="container">
  <br>
  <h4>Services</h4>
  <br>
  <table class="table table-hover"> 
  	<c:forEach items="${serv}" var="service">
  		<tr class="d-flex">
  		  		<td class="col-3">${service.name}</td>
  		  		<td class="col-3">${service.monthlyPrice}</td>
  		  		<td class="col-3"><button type="button" class="btn btn-success">add</button></td>
  		</tr>
  	</c:forEach>
   </table>
 </div>


</body>
</html>