<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subscription Services</title>

<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">


</head>
<body>
<<<<<<< HEAD
<p>${serv.name}<p>
=======

<%@ include file="nav.jsp" %>
<h2>${serv.name} </h2>
<div class="card">
<c:forEach items="${content}" var="details" varStatus="loop" begin="${serv.id -1}" end="${serv.id-1}">

  
  <div class="container">
  
  <table class="table table-hover"> 
  	<tr class="d-flex">
  		
  		
  		<th scope="col" class="col-6">Title</th>
  		<th scope="col" class="col-3">Rating</th>
  		<th scope="col" class="col-3">Add</th>
  		
    <c:forEach items="${details}" var="indivContent">
  	<tr class="d-flex" scope="row"> 
  		<td class="col-6">${indivContent.title}</td>
  		<td class="col-3">rating</td>
  		<td class="col-3"><button type="button" class="btn btn-success">add</button></tr>
  	
    
    </c:forEach>
    </table>
  </div>
    </c:forEach>
</div> 
>>>>>>> 73225da370a0e585f41af3bcd7c845bbb0876916
</body>
</html>