<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Up-Stream</title>

<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
	
</head>
<body>

<%@ include file="nav.jsp" %>

<br>

<p><a href="topContByServ.do?id=1" style="text-decoration: none"> Get Content By Rating (under construction)</a></p>

<c:forEach items="${services}" var="service" varStatus="loop" begin="0" end = "10">
<!-- SERVICE DIV: new DIV for each service -->
	
<!-- DIV for service name AND LINK (needs to be added in a tag)  -->
	<div>
	<br>
		<c:forEach items="${serviceType}" var="typename" begin="${loop.index}" end = "${loop.index}">
		<p><a href="getService.do?id=${loop.index+1}" style="text-decoration: none"> ${typename.name} </a></p>
		</c:forEach>
	</div>


	<div class="items">
		<c:forEach items="${service}" var="content" begin="0" end = "10">
<!-- DIV for individual content cards -->
    		<a href="getContents.do?id=1" style="text-decoration: none"> 
    		
<!--     		
    		<div class="card" style="width: 18rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div> -->
    		
    		
    		
    		
    		
    		
    		
    		
    			<div class="item" style="background-image: url(${content.image.url})">
    			
    			<div class="cardimg"> ${content.title} </div>
    			
    			
    			
    			</div>
    		
    		</a>
    		
    	</c:forEach>
	</div>
		
</c:forEach>


 <script>
  const slider = document.querySelector(".items");
  let isDown = false;
  let startX;
  let scrollLeft;
  slider.addEventListener('mousedown', (e) => {isDown = true;
    slider.classList.add('active');
    startX = e.pageX - slider.offsetLeft;
    scrollLeft = slider.scrollLeft;
  });
  slider.addEventListener('mouseleave', () => {isDown = false;
    slider.classList.remove('active');
  });
  slider.addEventListener('mouseup', () => {isDown = false;
    slider.classList.remove('active');
  });
  slider.addEventListener('mousemove', (e) => {
    if (!isDown) return; 
    e.preventDefault();
    const x = e.pageX - slider.offsetLeft;
    const walk = (x - startX) * 3;
    slider.scrollLeft = scrollLeft - walk;
  });
</script> 
</body>
</html>