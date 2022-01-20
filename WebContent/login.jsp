<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>민정이의 로그인 폼</title>
<style>
section h2{
	text-align:center;
	font-size:2em;
}
#tab1{
	width:15%;
	height:20px;
	text-align:center;
	font-weight:bold;
	margin:0 auto;
}
</style>
</head>
<body>
<section>
<h2>Login</h2>
<form name="form" method="post" action="loginProcess.jsp">
<table border=1 id="tab1">
	<tr>
		<td>userName</td>
		<td><input type="text" name="userName"></td>
	</tr>
	<tr>
		<td>password</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="Login">
		</td>
	</tr>
</table>
</form>
</section>
</body>
</html>