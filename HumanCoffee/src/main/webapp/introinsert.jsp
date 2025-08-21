<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./logi\.jsp" method="post" class=login-form>
		<h2>Human Coffee 로그인</h2>
		<div>
			<label>아이디 입력</label>
			<input type="text" name="id" placeholder="아이디를 입력해주세요.">
		</div>
		<div>
			<label>비밀번호 입력</label>
			<input type="password" name="pw" placeholder="비밀번호를 입력해주세요.">
		</div>
		<button type="submit">로그인</button>
		<a href="../index.jsp" class="btn">취소</a>
		<a href="./signup_form.jsp" class="signup-link">회원가입</a>
	</form>
</body>
</html>