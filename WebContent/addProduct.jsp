<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.productId.value==""){
			alert("상품코드를 입력하세요.");
			document.form.productId.focus();
		}else if(document.form.name.value==""){
			alert("상품명을 입력하세요.");
			document.form.name.focus();
		}else if(document.form.name.value.length<4||document.form.name.value.length>50){
			alert("[상품명]\n 최소 4자에서 최대 50자까지 입력하세요");
			document.form.name.focus();
		}else if(document.form.unitprice.value==""){
			alert("가격을 입력하세요.");
			document.form.unitprice.focus();
		}else if(document.form.unitprice.value.length==0 || isNaN(document.form.unitprice.value)){
			alert("[가격]\n 숫자만 입력하세요");
			document.form.unitprice.focus();
		}else if(document.form.unitprice.value<0){
			alert("[가격]\n 음수를 입력할 수 없습니다.");
			document.form.unitprice.focus();
		}else{
			document.form.submit();
			alert("등록이 완료되었습니다.");
		}
	}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<form name="form" method="post" action="addProduct_Process.jsp">
<h1>상품 등록 화면</h1>
<hr>
<table border=1 id="tab1">
	<tr>
		<th>상품코드</th>
		<td><input type="text" name="productId" id="in1"></td>
	</tr>
	<tr>
		<th>상품명</th>
		<td><input type="text" name="name" id="in1"></td>
	</tr>
	<tr>
		<th>가 격</th>
		<td><input type="text" name="unitprice" id="in1"></td>
	</tr>
	<tr>
		<th>상세정보</th>
		<td><input type="text" name="description" id="in1"></td>
	</tr>
	<tr>
		<th>제조사</th>
		<td><input type="text" name="manufacturer" id="in1"></td>
	</tr>
	<tr>
		<th>분 류</th>
		<td><input type="text" name="category" id="in1"></td>
	</tr>
	<tr>
		<th>재고수</th>
		<td><input type="text" name="unitsInstock" id="in1"></td>
	</tr>
	<tr>
		<th>상 태</th>
		<td>
			<input type="radio" name="condition" value="신규 제품" checked>신규 제품
			<input type="radio" name="condition" value="중고 제품">중고 제품
			<input type="radio" name="condition" value="재생 제품">재생 제품
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center height="30px">
			<input type="button" value="등록" id="btn1" onclick="check()">
			<input type="reset" value="취소" id="btn1">
		</td>
	</tr>
</table>
<hr>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>