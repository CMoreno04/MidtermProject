<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>
<body>

	<h1 class="header">Log In</h1>
	<form action="login.do" class="header" method="get">
		<div class="container">
		<tr>
			<td><label for="uname"><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="uname" required></td>
		</tr>
		<tr>
				
			<td><label for="psw"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="psw" required> </td>
		</tr>
			<button type="submit">Login</button>

		</div>
	</form>
</body>
</html>