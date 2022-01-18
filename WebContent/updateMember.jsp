<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
   function check(){
      if(document.form.name.value==""){
         alert("이름을 입력하세요.");
         document.form.name.focus();
      }else if(document.form.password.value==""){
         alert("비밀번호를 입력하세요.");
         document.form.password.focus();
      }else if(document.form.password_check.value==""){
         alert("확인비밀번호를 입력하세요.");
         document.form.password_check.focus();
      }else if(document.form.password.value!=document.form.password_check.value){
         alert("비밀번호를 동일하게 입력하세요.");
         document.form.password_check.focus();
      }else{
         document.form.submit();
      }
   }
   
   function mail_change(){
      if(document.form.mail.options[document.form.mail.selectedIndex].value=="0"){
         document.form.mail2.disabled=true;
         document.form.mail2.value=="";
      }
      if(document.form.mail.options[document.form.mail.selectedIndex].value=="9"){
         document.form.mail2.disabled=false;
         document.form.mail2.focus();
      }else{
         document.form.mail2.disabled=true;
         document.form.mail2.value=document.form.mail.options[document.form.mail.selectedIndex].value;
      }
   }
</script>
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
   String id=request.getParameter("id");
   String sel="";
   try{
      String sql="select * from member0117 where id=?";
      pstmt=conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs=pstmt.executeQuery();
      if(rs.next()){
         String name=rs.getString("name");
         String password=rs.getString("password");
         String gender=rs.getString("gender");
         String birth=rs.getString("birth");
         String birth_yy=birth.substring(0,4);
         int birth_mm=Integer.parseInt(birth.substring(5,7));
         int birth_dd=Integer.parseInt(birth.substring(8,10));
         String mail=rs.getString("mail");
         String []ary=mail.split("@");
         String mail1="", mail2="", mm2="";
         for(int i=0;i<ary.length;i++){
            mail1=ary[0];
            mail2=ary[1];
         }
         String phone=rs.getString("phone");
         String address=rs.getString("address");
%>
<form name="form" method="post" action="updateMember_Process.jsp">
<h1>회원 가입 수정 화면</h1>
<hr>
<table border=1 id="tab1">
   <tr>
      <th>아이디</th>
      <td><input type="text" name="id" id="in1" value="<%=id %>">(마지막번호+1)</td>
   </tr>
   <tr>
      <th>성명</th>
      <td><input type="text" name="name" id="in1" value="<%=name %>"></td>
   </tr>
   <tr>
      <th>비밀번호</th>
      <td><input type="password" name="password" id="in1" value="<%=password %>"></td>
   </tr>
   <tr>
      <th>비밀번호 확인</th>
      <td><input type="password" name="password_check" id="in1" value="<%=password %>"></td>
   </tr>
   <tr>
      <th>성별</th>
      <td>
         <input type="radio" name="gender" value="남성" <%if(gender.equals("남성")){%>checked<%}%>>남성
         <input type="radio" name="gender" value="여성" <%if(gender.equals("여성")){%>checked<%}%>>여성
      </td>
   </tr>
   <tr>
      <th>생일</th>
      <td>
         <input type="number" name="birth1" min="1930" max="2022" step="1" value="<%=birth_yy %>" id="in2">년
         <select name="birthm">
            <%for(int i=1;i<=12;i++){sel=""; %>
            
            <%if(birth_mm==i){sel="selected";}if(i<10){mm2="0"+i;} %>
            <option value="<%=mm2 %>"<%=sel %>><%=mm2 %></option>
            <%} %>            
         </select>월
         <select name="birthd">
            <%for(int i=1;i<=31;i++){sel=""; %>
            
            <%if(birth_dd==i){sel="selected";} %>
            <option value="<%=i %>"<%=sel %>><%=i %></option>
            <%} %>
         </select>일
      </td>
   </tr>
   <tr>
      <th>이메일</th>
      <td>
         <input type="text" name="mail1" value="<%=mail1 %>" onfocus="this.value='';">@
         <input type="text" name="mail2" value="<%=mail2 %>">
      </td>
   </tr>
   <tr>
      <th>연락처</th>
      <td><input type="text" name="phone" id="in1" value="<%=phone %>"></td>
   </tr>
   <tr>
      <th>주소</th>
      <td><input type="text" name="address" id="in1" value="<%=address %>"></td>
   </tr>
   <tr>
      <td colspan=2 align=center>
         <input type="button" value="수정" id="btn1" onclick="check()">
         <input type="reset" value="취소" id="btn1">
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
<hr>
</form>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>