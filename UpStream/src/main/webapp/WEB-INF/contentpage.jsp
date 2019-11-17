<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${contents.title}</title>

<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
	
</head>
<body>

<%@ include file="nav.jsp" %>



<div class="container-fluid">
	<div class="row vidanddescrip">
	
	
	<!-- Video and image column -->
	<div class="col-md" style="padding: 0px">

	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="false" style="height: 100%; padding: 0px">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	     
	     <div class="iframe-container">
	     <iframe class="embed-responsive-item" width="100%" height="200vh" src="${contents.video.url}?rel=0&showinfo=0&autohide=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	      </div>
	    </div>
	    <div class="carousel-item">
	    <div class="img-container">
	      <img src="${contents.image.url}" alt="${contents.title} image">
	      </div>
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="false"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>

	</div>
	
	
	<!-- description column -->
	<div class="col-md">
	
	
	
	<table class="table table-hover"> 
  	<tr class="d-flex">
  		<th class="col-12"><h4>${contents.title}</h4></th>
  	</tr>
  	<tr class="d-flex"> 
  		<td class="col">
  			<c:choose>
    			<c:when test="${average <= '1'}">
				⚡
    			</c:when> 
    			<c:when test="${average <= '2.5'}">
    			⚡⚡
    			</c:when> 
    			<c:when test="${average <= '3.5'}">
    			⚡⚡⚡
    			</c:when> 
    			<c:when test="${average <= '4.5'}">
    			⚡⚡⚡⚡
    			</c:when> 
				<c:when test="${average < '5'}">
				⚡⚡⚡⚡⚡
    			</c:when> 
 			   <c:otherwise> ${average} </c:otherwise> 
			</c:choose>
  		</td>
  	</tr>
  	<tr class="d-flex">
  		<td class="col">
  		
  		<div class="overflow-auto" style="height: 100px">${contents.description} </div>
  		
  		</td>
  	</tr>
  	<tr class="d-flex text-center">
 
 <!-- Change or add buttons here as nesesary..  May need to be switched to input fields when mapped. --> 	
  	<td class="col-6"><button type="button" class="btn btn-success">Currently Watching</button></td>
  	<td class="col-6"><button type="button" class="btn btn-primary">Wish list</button></td>
  	</tr>
    </table>
	
	</div>
	</div>
</div>



<div class="container" style="margin-top: 60px; border-radius:10px; padding:10px; box-shadow: 0 5px 15px 5px rgba(153, 153, 153, 0.35);">
	<form action="review.do" method="POST" class="container">
	<div class="form-group">
	<!-- Review Form -->
	<h3>Review</h3>
	<div class="form-group">
	Rating: <br>
	<select name="rating" style="background-color: rgba(255, 255, 255, 0.4); color: black;">
		<option value="1">⚡</option>
		<option value="2">⚡⚡</option>
		<option value="3" selected>⚡⚡⚡</option>
		<option value="4">⚡⚡⚡⚡</option>
		<option value="5">⚡⚡⚡⚡⚡</option>
	</select>
	</div>
	<br>
	Comment: <br>
	<textarea class="form-control" name="review" rows="5" cols= "50" style="background-color: rgba(255, 255, 255, 0.4); color: black;">
	</textarea>
	<!-- change to <input submit> and use button class. -->
	<button type="button" class="btn btn-success">Submit</button>
	</div>
	</form>
</div>



<!--  START REVIEWS  -->
<div class="container" style="margin-top: 60px">


<table class="table">
	<tr class="d-flex">
		<td class="col text-center"><h4>Reviews</h4></td>	
	</tr>

<c:forEach items="${reviews}" var="rev" varStatus="loop">
	<tr class="d-flex">
		<td class="col">
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
		<td class="col">${rev.comment}</td>
	</tr>
</c:forEach>

</table>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>