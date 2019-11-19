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
        <c:if test = "${reviews != null}">
            <c:choose>
                <c:when test="${averageRating <= '1'}">
                ⚡
                </c:when> 
                <c:when test="${averageRating <= '2.5'}">
                ⚡⚡
                </c:when> 
                <c:when test="${averageRating <= '3.5'}">
                ⚡⚡⚡
                </c:when> 
                <c:when test="${averageRating <= '4.5'}">
                ⚡⚡⚡⚡
                </c:when> 
                <c:when test="${averageRating <= '5'}">
                ⚡⚡⚡⚡⚡
                </c:when> 
               <c:otherwise> Content has not been rated yet. </c:otherwise> 
            </c:choose>
        </c:if>
        </td>
        <td class="col">
            <img src="${contents.service.logo}" width="50px"> 
        </td>
    </tr>
    <tr class="d-flex">
        <td class="col">
        <div style="display: inline-flex;">
            <c:forEach items="${contents.genres}" var="genre" varStatus="loop">
                <h6><span class="badge badge-secondary">${genre.name}</span></h6>&nbsp;&nbsp; 
            </c:forEach>
        </div>
        <td>
    </tr>
    <tr class="d-flex">
        <td class="col">
        
        <div class="overflow-auto" style="height: 100px">${contents.description} </div>
        
        </td>
    </tr>
    <tr class="d-flex text-center">
 
 <!-- Change or add buttons here as nesesary..  May need to be switched to input fields when mapped. -->  
    <td class="col">
    
    
    
    
    
    <form>
        <input class="btn btn-success btn-sm" type="submit" value="Currently Watching">
    </form>
    
    
    
    
    
    
    </td>
    <!-- <td class="col-6"><button type="button" class="btn btn-primary">Wish list</button></td> -->
    </tr>
    </table>
    
    </div>
    </div>
</div>
<!-- START OF COMMENT BOX   IF USER IS LOGGED IN AND HAS NOT MADE A COMMENT -->
<c:if test="${not empty user}">
<c:if test="${userreview == null}">
<div class="container" style="margin-top: 60px; border-radius:10px; padding:10px; box-shadow: 0 5px 15px 5px rgba(153, 153, 153, 0.35);">

	<form action="createReview.do" method="POST" class="container">
	<!-- <div class="form-group"> -->
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
	<textarea class="form-control" name="comment" rows="5" cols= "50" style="background-color: rgba(255, 255, 255, 0.4); color: black;"></textarea>
	
	<!-- insert for user id?>?? -->
	<input type="hidden" name="userId" value="${user.id}">
 	 <input type="hidden" name="revId" value="${rev.id}"> 
	<input type="hidden" name="contentId" value="${contents.id}"> 
	<input class="btn btn-success btn-shadow px-3 my-2 ml-0 text-left nav__links" type="submit" value="Add review"><br>	
	
	</form>

</div>
</c:if>
</c:if>
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
<c:choose>
    <c:when test="${user.id == rev.userId}">
    <tr class="d-flex bg-secondary">
    <td class="col">
    
    <div class="text-right">
    <div class="text-center" style="display: inline-flex;">
<!-- Submit buttons -->
<!-- Button TO TRIGGER MODAL -->
    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#exampleModalScrollable${rev.rating}" style="margin-right: 10px">
      Update Review
    </button>
    
<!-- Modal START -->

	<div class="modal fade" id="exampleModalScrollable${rev.rating}" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
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
	
	      <form action="updateReview.do" method="POST"  modelAttribute="review" style="margin-right: 10px">
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
				<input type="hidden" name="contentId" value="${contents.id}">
				<input type="hidden" name="revId" value="${rev.id}"> <br>
				<input class="btn btn-warning btn-sm" type="submit" value="Update">
		</form>
	    </div>
	    </div>
	  </div>
	</div>
		
<!-- DELETE BUTTON -->		
		<form action="deleteReview.do" method="GET" >
			<input type="hidden" name="userId" value="${user.id}">
			<input type="hidden" name="contentId" value="${contents.id}">
			<input type="hidden" name="revId" value="${rev.id}">
			<input class="btn btn-danger btn-sm" type="submit" value="delete">
		</form>	
	</div>
	</div>
	</td>		       
	</tr>
	</c:when>
	<c:when test="${empty user}"></c:when> 
	<c:when test="${user.id != rev.userId}"></c:when>
</c:choose>
</c:forEach>
</table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>