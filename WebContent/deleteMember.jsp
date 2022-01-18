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
   
   try{
      String sql="delete from member0117 where id=?";
      pstmt=conn.prepareStatement(sql);
      pstmt.setString(1, id);
      pstmt.executeUpdate();
      System.out.println("데이터 삭제 성공");
%>
      <script>
         alert("데이터 삭제를 완료하였습니다!");
         location.href="selectMember.jsp";
      </script>
<%
   }catch(SQLException e){
      System.out.println("데이터 삭제 실패");
      e.printStackTrace();
   }
%>
      <script>
         alert("데이터 삭제를 실패하였습니다!");
         history.back(-1);
      </script>
</body>
</html>