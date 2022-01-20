<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //세션 삭제시키는 기능
	response.sendRedirect("index.jsp");
%>
