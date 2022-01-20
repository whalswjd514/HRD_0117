<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#tab1{
	border-collapse:collapse;
	border-left:none;
	border-right:none;	
}
#t1{
	border-bottom:none;
	height:30px;
}
.line{
	border-bottom:1px solid lightgray;
}
.line_1{
	border-bottom:1px solid lightblue;
}
#btn1{
	width:18%;
	height:30px;
	background:#282828;
	color:white;
}
</style>
</head>
<body>
<% 
	String checkName="";
	checkName=(String)session.getAttribute("s_name");

	if(checkName==null)
	{
		%>
		<script>
		self.window.alert("먼저 로그인하세요.");
		location.href="index.jsp";
		</script>
		<%
	}
%>
<form name="form" method="post" action="writeBoardProcess.jsp">	
<table border=1 align=center id="tab1">
	<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;" id="t1">
		<td width=5><img src="images/table_left.gif" width=5 height=30></td>
		<td width=80%>글쓰기</td>
		<td width=7><img src="images/table_right.gif" width=5 height=30></td>
	</tr>
	<tr class="line">
		<th>제목</th>
		<td><input type="text" name="title"></td>
	</tr>
	<tr class="line">
		<th>이름</th>
		<td><input type="text" name="name" value="<%=checkName %>"></td>
	</tr>
	<tr class="line">
		<th>비밀번호</th>
		<td><input type="password" name="password"></td>
	</tr>
	<tr class="line_1">
		<th>내용</th>
		<td><textarea name="content" rows=15 cols=80></textarea></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="등록" id="btn1">
			<input type="reset" value="취소" id="btn1"> 
		</td>
	</tr>
</table>
</form>
</body>
</html>