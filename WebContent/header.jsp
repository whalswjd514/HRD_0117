<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
<%
	String checkName="";
	checkName=(String)session.getAttribute("s_name");
	System.out.println("name : "+checkName);

 	if(checkName==null){
%>
	<h1>쇼핑몰에 오신 것을 환영합니다.</h1>
	<div class="login">
	<fieldset>
		<form name="form" method="post" action="loginProcess.jsp">
			회원ID:<input type="text" name="id" id="h_in1">
			비밀번호:<input type="password" name="password" id="h_in1">
			<input type="submit" value="로그인">
			<a href="addMember.jsp">회원가입</a>
		</form>
	</fieldset>
	</div>
<%
	}else{
		session.setMaxInactiveInterval(50);
%>
	<h1>쇼핑몰에 오신 것을 환영합니다.</h1>
	<div class="login">
		<%=checkName %>님 환영합니다.
		<a href="logout.jsp">logout</a>
		<a href="addMember.jsp">회원가입</a>
	</div>
<%} %>
</header>
</body>
</html>