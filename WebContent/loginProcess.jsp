<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("password");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select id,password,name from member0117 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String userID=rs.getString(1);
			String userName=rs.getString(3);
			String userPwd=rs.getString(2);
			if(pass.equals(userPwd)){
				%>
				<%=userName %>님 환영합니다.
				<%
				  session.setAttribute("s_name", userName);
				  session.setAttribute("s_id", userID);
				  response.sendRedirect("index.jsp");
			}else{
				%>
				<script>
					alert("패스워드가 일치하지 않습니다.");
					history.back(-1);
				</script>
				<%
			}
		}else{
			%>
			<script>
				alert("등록되지 않은 아이디입니다.");
				history.back(-1);
			</script>
			<%
		}
	}catch(SQLException e){
		System.out.println("데이터베이스 읽기 실패");
		e.printStackTrace();
	}
%>
</body>
</html>