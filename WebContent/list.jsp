<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
h1{
	text-align:center;
}
.btn_group{
	margin:10px 0 0 0;
}
.btn_group button{
	width:100px;
	height:25px;
	background:lightgray;
	text-align:center;
}
#tab1{
	text-align:center;
	width:100%;
}
#p1{
	padding:0 0 0 5px;
	border-top:4px solid #28E7FF;
}
.line{
	border-bottom:1px solid lightblue;
}
.t1{
	background:#BEEFFF;
}
</style>
</head>
<body>
<section>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select count(*) from board";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			no=rs.getInt(1);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
<h1>게시판 글쓰기 테스트</h1>
<p id="p1">총 게시물 : <%=no %>개</p>
<table align=center id="tab1">
	<tr height=5>
		<td width=5></td>
	</tr>
	<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
		<td width=5><img src="images/table_left.gif" width=5 height=30></td>
		<td width=73 class="t1">번호</td>
		<td width=379 class="t1">제목</td>
		<td width=73 class="t1">작성자</td>
		<td width=164 class="t1">작성일</td>
		<td width=58 class="t1">조회수</td>
		<td width=7><img src="images/table_right.gif" width=5 height=30></td>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	
	try{
		String sql="select num,name,password,title,memo,time,hit,ref,indent,step from board";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String num=rs.getString(1);
			String name=rs.getString(2);
			String password=rs.getString(3);
			String title=rs.getString(4);
			String memo=rs.getString(5);
			String time=rs.getString(6);
			String hit=rs.getString(7);
			String ref=rs.getString(8);
			String indent=rs.getString(9);
			String step=rs.getString(10);
			System.out.println("게시판 데이터 읽기 성공");
%>
	<tr>
		<td class="line"></td>
		<td class="line"><%=num %></td>
		<td class="line"><a href="#"><%=title %></a></td>
		<td class="line"><%=name %></td>
		<td class="line"><%=time %></td>
		<td class="line"><%=hit %></td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("게시판 데이터 읽기를 실패.");
		e.printStackTrace();
	}
%>
</table>
<div class="btn_group" align=center>
	<button type="button" onclick="location.href='writeBoard.jsp'">글쓰기</button>
</div>
</section>
</body>
</html>