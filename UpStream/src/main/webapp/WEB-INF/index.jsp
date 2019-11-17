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
<!-- 
<p><a href="topContByServ.do?id=1" style="text-decoration: none"> Get Content By Rating (under construction)</a></p> -->

<c:forEach items="${services}" var="service" varStatus="loop" begin="0" end = "10">
<!-- SERVICE DIV: new DIV for each service -->
	<div class="titlebox">
		<c:forEach items="${serviceType}" var="typename" begin="${loop.index}" end = "${loop.index}">
		<h4 class="servicetitle"><a href="getService.do?id=${loop.index+1}" style="text-decoration: none" class="servicetitle"> ${typename.name} </a></h4>
		</c:forEach>
	</div>

	<!-- DIV for individual content cards -->
	<div class="items">
		<c:forEach items="${service}" var="content" begin="0" end = "10">
    		<a href="getContents.do?id=${content.id}" style="text-decoration: none">     		
    			<div class="item">
    				<div class="cardimg" style="background-image: url(${content.image.url})"></div>
    				<div class="cardtxt">${content.title}</div>
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