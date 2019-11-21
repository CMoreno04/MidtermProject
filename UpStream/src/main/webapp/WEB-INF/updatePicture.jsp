<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Picture Update</title>


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
				<h1>Update Profile Picture</h1>
				<c:if test="${not empty message}">
					<h4 style="color: red;">${message}</h4>
				</c:if>
				<div class="form-row center">
					<form:form action="updateProfilePic.do" method="POST"
						modelAttribute="userImage">
						<form:label path="id">Profile Image</form:label>
						<form:select path="id">
							<form:option value="1">Dumbo</form:option>
							<form:option value="2">Powerline</form:option>
							<form:option value="3">The Mask</form:option>
							<form:option value="4">Superman</form:option>
							<form:option value="5">Stewie</form:option>
							<form:option value="6">Elmo</form:option>
							<form:option value="7">Yoda</form:option>
							<form:option value="8">Porg</form:option>
							<form:option value="9">Boba Fett</form:option>
							<form:option value="10">Mr. Burns</form:option>
							<form:option value="11">Squirtle</form:option>
							<form:option value="12">Pennywise</form:option>
							<form:option value="13">Cersei</form:option>
							<form:option value="14">Thor</form:option>
							<form:option value="15">Harley Quinn</form:option>
							<form:option value="16">Deadpool</form:option>
							<form:option value="17">Elevin</form:option>
							<form:option value="18">Linus</form:option>
							<form:option value="19">Resavoir Dogs</form:option>
							<form:option value="20">Malefecent</form:option>
						</form:select>
						<form:button type="submit" class="btn btn-success">Submit</form:button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>	
</body>
</html>