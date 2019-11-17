<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<div class="container-fluid" style="padding-top: 2in;">
		<div class="row row-no-gutters">
			<div class="col-xs-6 col-md-4"></div>
			<div class="col-xs-6 col-md-4 text-center">

				<form:form action="**.do" method="POST" modelAttribute="user">
					<div class="form-row">
						<div class="form-group col-md-6">
							<form:label path="firstName">First Name</form:label>
							<form:input type="text" class="form-control" required="required"
								path="firstName" placeholder="First Name" />
						</div>
						<div class="form-group col-md-6">
							<form:label path="lastName">Last Name</form:label>
							<form:input type="text" required="required" class="form-control"
								path="lastName" placeholder="Last Name" />
						</div>
					</div>
					<div class="form-group col-md-6">
						<form:label path="username">Username</form:label>
						<form:input type="text" class="form-control" required="required"
							path="usernaame" placeholder="Username" />
					</div>
					<div class="form-group col-md-6">
						<form:label path="password">Password</form:label>
						<form:input type="password" class="form-control"
							required="required" path="password" placeholder="Password" />
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<form:label path="overall">Overall Ability </form:label>
							<form:input type="number" class="form-control"
								required="required" min="1" path="overall"
								placeholder="Overall Ability" />
						</div>
						<div class="form-group col-md-6">
							<form:label for="userImage">Image</form:label>
							<form:select id="userImage" class="form-control">
								<form:option value=1>Anna</form:option>
								<form:option value=2>Jerry, The Minion</form:option>
								<form:option value=3>Doris</form:option>
								<form:option value=4>Voldemort</form:option>
								<form:option value=5>...</form:option>
								<form:option value=6>...</form:option>
								<form:option value=7>...</form:option>
								<form:option value=8>...</form:option>
								<form:option value=9>...</form:option>
								<form:option value=10>...</form:option>
								<form:option value=11>...</form:option>
								<form:option value=12>...</form:option>
								<form:option value=13>...</form:option>
								<form:option value=14>...</form:option>
								<form:option value=15>...</form:option>
								<form:option value=16>...</form:option>
								<form:option value=17>...</form:option>
								<form:option value=18>...</form:option>
								<form:option value=19>...</form:option>
								<form:option value=20>...</form:option>
							</form:select>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>