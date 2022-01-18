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
   String productId=request.getParameter("productId");
   
   try{
      String sql="delete from product0117 where productId=?";
      pstmt=conn.prepareStatement(sql);
      pstmt.setString(1, productId);
      pstmt.executeUpdate();
      System.out.println("데이터 삭제 성공");
%>
      <script>
         alert("데이터 삭제를 성공하였습니다!");
         location.href="productList.jsp";
      </script>
<%
   }catch(SQLException e){
      System.out.println("데이터 삭제 실패");
   }
%>
      <script>
         alert("데이터 삭제를 실패하였습니다!");
         history.back(-1);
      </script>
</body>
</html>