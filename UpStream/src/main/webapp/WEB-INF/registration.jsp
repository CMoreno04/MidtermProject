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
				<c:if test="${not empty message}">
					<h4 style="color: red;">${message}</h4>
				</c:if>

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
					<div class="form-row center">
				<form:form action="register.do" method="POST" modelAttribute="profileImg">
						<form:label path="id">Profile Image</form:label>
						<select>
							<option value="1">Dumbo</option>
							<option value="2">Powerline</option>
							<option value="3">The Mask</option>
							<option value="4">Superman</option>
							<option value="5">Stewie</option>
							<option value="6">Elmo</option>
							<option value="7">Yoda</option>
							<option value="8">Porg</option>
							<option value="9">Boba Fett</option>
							<option value="10">Mr. Burns</option>
							<option value="11">Squirtle</option>
							<option value="12">Pennywise</option>
							<option value="13">Cersei</option>
							<option value="14">Thor</option>
							<option value="15">Harley Quinn</option>
							<option value="16">Deadpool</option>
							<option value="17">Elevin</option>
							<option value="18">Linus</option>
							<option value="19">Resavoir Dogs</option>
							<option value="20">Malefecent</option>
						</select>
						</form:form>



					</div>
					<br>
					<br>
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