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
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String productId=request.getParameter("productId");
	
	try{
		String sql="select orderDate,orderName,a.productId,b.name,a.unitprice,orderQty,orderAddress from order0117 a,product0117 b where a.productId=b.productId";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String orderDate=rs.getString("orderDate");
			String orderName=rs.getString("orderName");
			String name=rs.getString("name");
			String unitprice=rs.getString("unitprice");
			String pQty=rs.getString("orderQty");
			String total=rs.getString("total");
			String address=rs.getString("address");
			System.out.println("데이터 조회 성공");
%>
<form name="form" method="post" action="updateOrder_Process.jsp">
<h1>주문정보 수정화면</h1>
<table border=1 id="tab1">
	<tr>
		<th>주문일자</th>
		<td><input type="text" name="orderDate" value="<%=orderDate %>"></td>
		<th>주문자 이름</th>
		<td><input type="text" name="orderName" value="<%=orderName %>"></td>
	</tr>
	<tr>
		<th>상품코드</th>
		<td><input type="text" name="productId" value="<%=productId %>" onchange="changesubmit();"></td>
		<th>상품명</th>
		<td><input type="text" name="productName" value="<%=name %>"></td>
	</tr>
	<tr>
		<th>단 가</th>
		<td><input type="text" name="unitprice" value="<%=unitprice %>"></td>
		<th>주문수량</th>
		<td><input type="text" name="orderQty" value="<%=pQty %>" onchange="changesubmit();"></td>
	</tr>
	<tr>
		<th>주문금액</th>
		<td><input type="text" name="total" value="<%=total %>"></td>
		<th>주문주소</th>
		<td><input type="text" name="address" value="<%=address %>"></td>
	</tr>
	<tr>
		<td colspan=4 align=center>
			<input type="button" value="목록" id="btn2">
			<input type="submit" value="저장" id="btn2" onclick="check()">
		</td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</form>
<script>
	function check(){
		if(document.form.orderDate.value==""){
			alert("주문일자를 입력하세요.");
			document.form.orderDate.focus();
		}else if(document.form.orderName.value==""){
			alert("주문자이름을 입력하세요.");
			document.form.orderName.focus();
		}else if(document.form.productId.value==""){
			alert("상품코드를 입력하세요.");
			document.form.productId.focus();
		}else if(document.form.productName.value==""){
			alert("상품명을 입력하세요.");
			document.form.productName.focus();
		}else if(document.form.address.value==""){
			alert("주문자 주소를 입력하세요.");
			document.form.address.focus();
		}else{
			form.action="addOrder_Process.jsp";
		}
	}
	
	function changesubmit(){
		document.form.submit();
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>