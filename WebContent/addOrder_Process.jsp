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
	String orderDate=request.getParameter("orderDate");
	String orderName=request.getParameter("orderName");
	String productId=request.getParameter("productId");
	String unitprice=request.getParameter("unitprice");
	String orderQty=request.getParameter("orderQty");
	String address=request.getParameter("address");
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="insert into order0117 values(?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, orderDate);
		pstmt.setString(2, orderName);
		pstmt.setString(3, productId);
		pstmt.setString(4, unitprice);
		pstmt.setString(5, orderQty);
		pstmt.setString(6, address);
		pstmt.executeUpdate();
		System.out.println("주문정보 저장 성공");
		
		int stock=0;
		sql="select unitsInstock from product0117 where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs=pstmt.executeQuery();
		if(rs.next()){
			stock=rs.getInt(1);
		}else{
			stock=0;
		}
		sql="update product0117 set unitsInstock=? where productId=?";
		pstmt=conn.prepareStatement(sql);
		stock=stock-Integer.parseInt(orderQty);
		pstmt.setInt(1, stock);
		pstmt.setString(2, productId);
		pstmt.executeUpdate();
%>
		<script>
			alert("저장 및 수정 성공");
			history.back(-1);
		</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
</body>
</html>