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
   String name=request.getParameter("name");
   String unitprice=request.getParameter("unitprice");
   String description=request.getParameter("description");
   String category=request.getParameter("category");
   String manufacturer=request.getParameter("manufacturer");
   String unitsInstock=request.getParameter("unitsInstock");
   String condition=request.getParameter("condition");
   
   try{
      String sql="update product0117 set name=?,unitprice=?,description=?,category=?,manufacturer=?,unitsInstock=?,condition=? where productId=?";
      pstmt=conn.prepareStatement(sql);
      pstmt.setString(8, productId);
      pstmt.setString(1, name);
      pstmt.setString(2, unitprice);
      pstmt.setString(3, description);
      pstmt.setString(4, category);
      pstmt.setString(5, manufacturer);
      pstmt.setString(6, unitsInstock);
      pstmt.setString(7, condition);
      pstmt.executeUpdate();
      System.out.println("데이터 수정 성공");
%>
      <script>
         alert("데이터 수정을 성공하였습니다!");
         location.href="productList.jsp";
      </script>
<%
   }catch(SQLException e){
      System.out.println("데이터 수정 실패");
   }
%>
      <script>
         alert("데이터 수정을 실패하였습니다!");
         history.back(-1);
      </script>
</body>
</html>