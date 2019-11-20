<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>


<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>
<body>
	<%@ include file="nav.jsp"%>
	<br>
	<div class="container-fluid" id="register">
		<div class="row row-no-gutters">
			<div class="col-xs-6 col-md-4"></div>
			<div class="col-xs-6 col-md-4 text-center">
				<h1>Register</h1>

				<form:form action="register.do" method="POST" modelAttribute="user">
					<div class="form-row center">
							<form:label path="firstName">First Name</form:label>
							<form:input type="text" class="form-control" required="required"
								path="firstName" placeholder="First Name" />
						</div>
						<div class="form-row center">
							<form:label path="lastName">Last Name</form:label>
							<form:input type="text" required="required" class="form-control"
								path="lastName" placeholder="Last Name" />
						</div>
					<div class="form-row center">
						<form:label path="username">Username</form:label>
						<form:input type="text" class="form-control" required="required"
							path="username" placeholder="Username" />
					</div>
					<div class="form-row center">
						<form:label path="password">Password</form:label>
						<form:input type="password" class="form-control"
							required="required" path="password" placeholder="Password" />
					</div>
					<form:input type="hidden" path="active" value="true" default="true" />

					<%-- 					<div class="form-group col-md-6">
						<form:label path="userImage">Image</form:label>
						<form:select path="userImage" class="form-control">
							<form:option value="1">Anna</form:option>
							<form:option value="2">Jerry, The Minion</form:option>
							
						</form:select>
						<br> <br>
					</div> --%>
					<button type="submit" class="btn btn-success">Submit</button>
			</form:form>
			</div>
		</div>
	</div>
</body>
</html>