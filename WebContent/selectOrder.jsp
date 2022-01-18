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
		<th>no</th>
		<th>주문일자</th>
		<th>주문자 성명</th>
		<th>상품번호</th>
		<th>상품명</th>
		<th>단가</th>
		<th>주문수량</th>
		<th>주문자주소</th>
		<th>구분</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select to_char(orderDate,'yyyy-mm-dd'),orderName,a.productId,b.name,a.unitprice,orderQty,orderAddress from order0117 a,product0117 b where a.productId=b.productId";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int no=0;
		Date time;
		String orderDate="",orderName="";
		while(rs.next()){
			orderDate=rs.getString(1);
			orderName=rs.getString(2);
			String productId=rs.getString(3);
			String name=rs.getString(4);
			int unitprice=rs.getInt(5);
			int orderQty=rs.getInt(6);
			String address=rs.getString(7);
			no++;
			System.out.println("주문 정보 조회 성공");

%>
	<tr>
		<td><%=no %></td>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7) %></td>
		<td><a href="updateOrder.jsp?orderDate=<%=orderDate %> & orderName=<%=orderName %>">수정</a> / 
			<a href="deleteOrder.jsp?orderDate=<%=rs.getString(1) %> & orderName=<%=rs.getString(2) %>">삭제</a>
		</td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("주문 정보 조회 실패");
		e.printStackTrace();
	}
%>
</table>
<div class="btn_group" align=center>
	<button type="button" onclick="location.href='addOrder.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>