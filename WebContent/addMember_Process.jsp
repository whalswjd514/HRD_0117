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
	PreparedStatement pstmt=null;
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String gender=request.getParameter("gender");
	String birth=request.getParameter("birth1")+"/"+request.getParameter("birth2")+"/"+request.getParameter("birth3");
	String mail=request.getParameter("mail1")+"@"+request.getParameter("mail2");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String timestamp=request.getParameter("timestamp");
	
	try{
		String sql="insert into member0117 values(?,?,?,?,?,?,?,?,sysdate)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, password);
		pstmt.setString(4, gender);
		pstmt.setString(5, birth);
		pstmt.setString(6, mail);
		pstmt.setString(7, phone);
		pstmt.setString(8, address);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
%>
		<script>
			alert("데이터 등록을 완료하였습니다!");
			location.href="selectMember.jsp";
		</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("데이터 등록을 실패하였습니다!");
			history.back(-1);
		</script>
</body>
</html>