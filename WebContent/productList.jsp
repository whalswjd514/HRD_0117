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
<h1>상품 목록</h1>
<table border=1 id="tab2">
	<tr>
		<th id="th1">no</th>
		<th id="th1">제품코드</th>
		<th id="th1">제품명</th>
		<th id="th1">단가</th>
		<th id="th1">상세정보</th>
		<th id="th1">제조사</th>
		<th id="th1">분류</th>
		<th id="th1">재고수</th>
		<th id="th1">상태</th>
		<th id="th1">구분</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select * from product0117";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String productId=rs.getString(1);
			String name=rs.getString(2);
			String unitprice=rs.getString(3);
			String description=rs.getString(4);
			String manufacturer=rs.getString(5);
			String category=rs.getString(6);
			String unitsInstock=rs.getString(7);
			String condition=rs.getString(8);
			no++;
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=no %></td>
		<td><%=productId %></td>
		<td><%=name %></td>
		<td><%=unitprice %></td>
		<td><%=description %></td>
		<td><%=manufacturer %></td>
		<td><%=category %></td>
		<td><%=unitsInstock %></td>
		<td><%=condition %></td>
		<td><a href="updateproduct.jsp?productId=<%=productId %>">수정</a> / 
			<a href="deleteproduct.jsp?productId=<%=productId %>">삭제</a>
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
	<button type="button" onclick="location.href='addProduct.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>