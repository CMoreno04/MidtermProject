<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="nav.jsp" %>

<br>

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
    		<div class="item" style="background-image: url(${content.image.url})"></div>
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