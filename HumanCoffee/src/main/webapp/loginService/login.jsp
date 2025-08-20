<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.humancoffee.common.*" %>
<%@ page import = "com.humancoffee.model.*" %>
<%@ page import = "com.humancoffee.manager.*" %>
<%
	// out 내장객체로 웹 페이지 출력
	out.println("<h1>로그인 처리중입니다</h1>");

	// post로 요청한 파라미터 조회 - 파라미터 이름 수정
	String Id = request.getParameter("id");
	String password = request.getParameter("pw");
	
	ManageLogin mLogin = new ManageLogin();
	if(mLogin.login(Id, password)){
		
%>
<script>
	alert('로그인에 성공했습니다.');
	location.href='<%= request.getContextPath() %>/admin_notice_list.jsp';
</script>
<%
		} else {
			System.out.println("로그인 실패: 아이디 또는 암호가 잘못되었습니다.");
			// 로그인 실패 시 로그인 폼으로 리다이렉션
%>
<script>
	alert('아이디 또는 비밀번호가 올바르지 않습니다.');
	location.href='<%= request.getContextPath() %>/admin_notice_login_form.jsp?error=invalid';
</script>
<%
	}
%>