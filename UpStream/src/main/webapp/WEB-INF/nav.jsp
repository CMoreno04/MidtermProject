<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation</title>
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand header__text" style="color: #303030"
			href="index.do"> <img alt="Up-Stream" src="css/logo.png"
			width="150" height="70" style="border-radius:10px"></a>
		<!-- <button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor03" aria-controls="navbarColor03"
			aria-expanded="true" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button> -->
		<c:if test="${not empty sessionScope.user}">

			<div class="collapse navbar-collapse" id="navbarColor02">
						<h4 class="name">Streaming Service Tracker</h4>
				<ul class="navbar-nav ml-auto text-right list-inline" id="navlinks">
					<li class="nav-item"><a class="nav-link" href="getServices.do">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link header__text" href="about.do">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="goProfile.do">Profile</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="logout.do">Log
							Out</a></li>
					<li>
					</li>
				</ul>
			</div>
		</c:if>

		<c:if test="${empty sessionScope.user}">
			<div class="collapse navbar-collapse " id="navbarColor02">
						<h4 class="name">Streaming Service Tracker</h4>
				<ul class="navbar-nav ml-auto text-right list-inline">
					<li class="nav-item"><a class="nav-link" href="getServices.do">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link header__text" href="about.do">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="login.do">Log
							In</a></li>
					<li>
					</li>
				</ul>


				<!--  <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form> -->
			</div>
		</c:if>
	</nav>
</body>
</html>
