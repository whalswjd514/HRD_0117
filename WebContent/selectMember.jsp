<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<h1>회원 목록</h1>
<table border=1 id="tab2">
	<tr>
		<th id="th1">아이디</th>
		<th id="th1">성 명</th>
		<th id="th1">비밀번호</th>
		<th id="th1">성별</th>
		<th id="th1">생년월일</th>
		<th id="th1">이메일</th>
		<th id="th1">연락처</th>
		<th id="th1">주소</th>
		<th id="th1">입력일</th>
		<th id="th1">구분</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select * from member0117";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(2);
			String password=rs.getString(3);
			String gender=rs.getString(4);
			String birth=rs.getString(5);
			String mail=rs.getString(6);
			String phone=rs.getString(7);
			String address=rs.getString(8);
			String timestamp=rs.getString(9);

%>
	<tr>
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=password %></td>
		<td><%=gender %></td>
		<td><%=birth %></td>
		<td><%=mail %></td>
		<td><%=phone %></td>
		<td><%=address %></td>
		<td><%=timestamp %></td>
		<td><a href="updateMember.jsp?id=<%=id %>">수정</a> / 
			<a href="deleteMember.jsp?id=<%=id %>">삭제</a>
		</td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
<div class="btn_group" align=center>
	<button type="button" onclick="location.href='addMember.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>