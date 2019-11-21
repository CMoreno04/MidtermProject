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
	<nav class="navbar navbar-expand-lg navbar-light" style="padding: 0; background-color: rgba(32, 201, 151, 0.8);">
		
		<div style="display: inline-block; padding:0px; position: relative; margin-left: 10px; margin-top: 5px">
		<div stly="position: absolute" class="text-center">
		
		<div class="text-center">
		<a class="navbar-brand header__text" style="color: #303030" href="index.do"> 
			<img alt="Up-Stream" src="css/logo.png"  height="70" style="border-radius:10px; padding-right: 0;">
		</a>
		</div>
		
		<!-- <p style="font-size: 0.7em; margin-bottom:0px;font-weight:bold; " class="name text-center">Streaming Service Tracker</p> -->
		<h6 style="margin-right:10%; font-size: 0.9em; font-weight: 600; margin-top: 0px; color: #000">Streaming Service Tracker</h6>
		</div>
		</div>
		<!-- <button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor03" aria-controls="navbarColor03"
			aria-expanded="true" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button> -->
		<c:if test="${not empty sessionScope.user}">

			<div class="collapse navbar-collapse" id="navbarColor02">
<!-- 						<p style="font-size: 30px; margin-bottom:0px;font-weight:bold; "class="name">Streaming Service Tracker</p> -->
				<ul style="font-size: 20px; font-weight:bold; margin-right: 50px;"class="navbar-nav ml-auto text-right list-inline" id="navlinks">
					<li class="nav-item"><a class="nav-link" href="getServices.do">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link header__text" href="about.do">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="goProfile.do">Profile</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="logout.do">Log Out</a></li>
					<li>
					</li>
				</ul>
			</div>
		</c:if>

		<c:if test="${empty sessionScope.user}">
			<div class="collapse navbar-collapse " id="navbarColor02">
<!-- 						<p style="font-size: 30px; margin-bottom:0px;font-weight:bold; " class="name">Streaming Service Tracker</p> -->
				<ul style="font-size: 20px; font-weight:bold; margin-right: 50px; " class="navbar-nav ml-auto text-right list-inline">
					
					<li class="nav-item"><a href="#" class="nav-link" data-toggle="modal" data-target="#exampleModal">Search</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="getServices.do">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link header__text" href="about.do">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="login.do">Log
							In</a></li>
					<li>
					</li>
				</ul>

			</div>
		</c:if>
	</nav>
	
	
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Insert Search here
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success">Save changes</button>
      </div>
    </div>
  </div>
</div>
	
	
	
	
</body>
</html>
