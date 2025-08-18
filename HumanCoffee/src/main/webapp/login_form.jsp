<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!-- javascript -->
<script defer src="./js/main.js"></script>
<script defer src="./js/youtube.js"></script>
<!-- css -->
<link rel="stylesheet" href="./css/login.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Human Coffee Login</title>
</head>
<body>
	<form action="./login.jsp" method="post" class=login-form>
		<h2>로그인</h2>
		
		<div>
			<label>아이디 입력</label>
			<input type="text" name="id" placeholder="아이디를 입력해주세요.">
		</div>
		
		<div>
			<label>비밀번호 입력</label>
			<input type="password" name="pw" placeholder="비밀번호를 입력해주세요.">
		</div>
		
		<button type="submit">로그인</button>
		<a href="./index.jsp" class="btn">취소</a>
	</form>
	
	<script>
    // 엔터키로 로그인 가능하도록
    document.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            document.querySelector('.login-form').submit();
        }
    });
    </script>
</body>
</html>