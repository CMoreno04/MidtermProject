<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${user.username} Profile</title>

<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">

</head>
<body>

	<%@ include file="nav.jsp"%>
	
	<!-- PROFILE PIC AND USERNAME.  NEEDS TO BE REDONE FOR MOBILE>>>s-->
	<div class="container text-center align-middle" style="margin-top: 20px; border-radius:10px; padding:10px; box-shadow: 0 5px 15px 5px rgba(153, 153, 153, 0.35)">
<%--         <table>
	        <tr class="row d-flex">
		        <td class="col text-center">
		        	<div class="profile-pic text-center" style="margin-right: 10px"></div>
		        </td>
		        <td class="col">
		        	<h3 class="prof-name">${user.username} </h3>
		        </td>
		        <td class="col">
		        	<form action="goToUpdateUser.do" method="GET" >
		        		<input type="submit" value="Update Profile" class="btn btn-success btn-sm">
		       	 	</form>
		       	 	<form action="deleteUser.do" method="GET">
		       	 		<!-- <input type="hidden" > -->
						<input class="btn btn-outline-danger btn-sm" type="submit" value="delete">
					</form>

		        </td>
	        </tr>
    	</table> --%>
    	
    	
    	<div class="row">
    		<div class="col">
    		
    		
    		<!-- if user img null the profile pic will not display -->
    		<c:choose>
    			<c:when test="${user.userImage.url == null}">
    			</c:when>
    			<c:otherwise>
    			<img src="${user.userImage.url}" height="100vh" style="border-radius: 50%; max-width: 10rem; max-height: 10rem; border: 0.5rem solid #00bc8c;">
    			</c:otherwise>
    		</c:choose>
    		
    		</div>
    		<div class="col align-middle">
    			<h3 class="prof-name" style="margin-top: 10px; overflow:hidden;">${user.username}</h3>
    		</div>
    		<div class="col">
    		
    		<div class="row"><div class="col">
    			<form action="goToUpdateUser.do" method="GET" >
		        	<input type="submit" value="Update Profile" class="btn btn-success btn-sm" style="margin-top: 10px;">
		       	 </form>
    		</div></div>
    		<div class="row"><div class="col" >
		       	 <form action="deleteUser.do" method="GET">
       			<!-- <input type="hidden" > -->
					<input class="btn btn-outline-danger btn-sm" type="submit" value="delete" style="margin-top: 10px;">
				</form>    		
    		</div></div>
    		
    	</div>
    	

    	</div>
	</div>
	<!-- END USER INFRO BOX -->


<!-- START TOTALER -->
	<div class="container text-center" style="margin-top: 50px">
	<h4>Your monthly expenditure:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	<fmt:setLocale value="en_US" />
	<fmt:formatNumber value="${servTotal}" type="currency" />	
	</h4></div>


<!-- START USER SERVICES CARDS -->
	<div class="container text-center" style="margin-top: 50px">
	<table class="table table-borderless">
	<tr class="row">
	
	<c:forEach items="${userService}" var="service" varStatus="loop">
	<td class="col-4">
		
		
		<div class="container-fluid">
			<div class="card text-white mb-3 text-center d-flex" style="background-color: rgba(32, 201, 151, 0.2);">
				<!-- style="max-width: 20rem;"> -->
				<div class="card-header bg-secondary">
<%-- 				<table class="text-center table d-flex">
				<tr class="d-flex">
				<td class="col" style="text-align: center; background-color: #000">
					${service.name}
				</td>
				<td class="col">
					<form action="deleteService.do" method="POST">

				</td>
				</tr>
				</table> --%>
				<div class="container">
				<div class="row">
					<div class="col">
					<a href="getService.do?id=${service.id}">${service.name}</a>
					</div>
					<div class="col">
					<form action="deleteService.do" method="POST">
											<input type="hidden" name="servId" value="${service.id}"> 
						<input class="btn btn-outline-danger btn-sm" type="submit" value="delete">
					</form>
					</div>
				</div>
				</div>
				</div>
				<div class="card-body">
					<c:forEach items="${userContent}" var="content" varStatus="loop">
					<c:if test="${content.service.name == service.name}">
					<p class="card-text"><a href="getContents.do?id=${content.id}">${content.title}</a></p>
					</c:if>
					</c:forEach>
				</div>
			</div>
		</div>		
	</td>
	</c:forEach> 
	</tr>
	</table>
	</div>



<!--  START REVIEWS and CRUD-->
<div class="container" style="margin-top: 50px">
	<h4>Your Reviews:</h4>
	<table class="table">
	<c:forEach items="${reviews}" var="rev" varStatus="loop">
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
<!-- Button TO TRIGGER MODAL -->
	<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#exampleModalScrollable${rev.content.id}" style="margin-right: 10px">
	  Update Review
	</button>
<!-- Modal START -->
	<div class="modal fade" id="exampleModalScrollable${rev.content.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalScrollableTitle">Update Review</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div> 
	      <div class="modal-body">
	<!--       <form action="updateReview.do" method="POST" style="margin-right: 10px"> -->
	      <form action="updateReviewFromProf.do" method="POST"  modelAttribute="review" style="margin-right: 10px">
	     	 Rating:<br>
			<select name="rating" selected="${rev.rating}" style="background-color: rgba(255, 255, 255, 0.4); color: black;">
				<option value="1" ${rev.rating == '1' ? 'selected' : ''}>⚡</option>
				<option value="2" ${rev.rating == '2' ? 'selected' : ''}>⚡⚡</option>
				<option value="3" ${rev.rating == '3' ? 'selected' : ''}>⚡⚡⚡</option>
				<option value="4" ${rev.rating == '4' ? 'selected' : ''}>⚡⚡⚡⚡</option>
				<option value="5" ${rev.rating == '5' ? 'selected' : ''}>⚡⚡⚡⚡⚡</option>
			</select><br>
			Comment:<br>
			<textarea class="form-control"  name="comment" style="background-color: rgba(255, 255, 255, 0.4); color: black;">${rev.comment}</textarea>
				<input type="hidden" name="userId" value="${user.id}">
				<input type="hidden" name="contentId" value="${rev.content.id}">
				<input type="hidden" name="updateById" value="${rev.id}"> <br>
				<input class="btn btn-warning btn-sm" type="submit" value="Update">
		</form>
	    </div>
	    </div>
	  </div>
	</div>
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









<c:if test="${user.admin == true}">
<div class="container text-center" style="margin-top: 70px; margin-bottom: 20px; border-radius:10px; padding:10px; box-shadow: 0 5px 15px 5px rgba(153, 153, 153, 0.35)">
<h4 style="margin-bottom: 10px">Admin Center</h4>

<form action="peekaboo.do" method="POST">
	<input type="submit" class="btn btn-secondary btn sm" value="See List Of Users">
</form>



2.  Add Content<br>
3.  Add Service (stretch)<br>
</div>

</c:if>













<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>