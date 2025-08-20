<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에서 이용자 정보 제거 (로그아웃 처리)
	session.removeAttribute("id");
	
	out.println("<h1>로그아웃 처리중입니다</h1>");
%>

<script>
	alert("로그아웃되었습니다.");
	location.href='<%= request.getContextPath() %>' + '/index.jsp';
</script>