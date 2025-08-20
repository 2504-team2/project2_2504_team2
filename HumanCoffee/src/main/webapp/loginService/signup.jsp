<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	// out 내장객체로 웹 페이지 출력
	out.println("<h1>회원가입 처리중입니다</h1>");

	// post로 요청한 파라미터 조회 - 파라미터 이름 수정
	String Id = request.getParameter("id");
	String password = request.getParameter("pw");
	String name = request.getParameter("name");
	String PHnumber = request.getParameter("tel");
	
	System.out.println(Id+","+password+","+name+","+PHnumber);
%>