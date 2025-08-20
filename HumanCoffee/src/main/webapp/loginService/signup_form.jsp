<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/signup.css" />
<!-- 로그인 기능 관련 JS -->
<script src="<%=request.getContextPath()%>/js/login.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Human Coffee Member Join</title>
</head>
<body>
 	<div class="join-form">
    <h2>Human Coffee 회원가입</h2>

    <form action="signup.jsp" method="post">
        <div>
            <label for="id">아이디 입력</label>
            <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요." required>
        </div>
        <div>
            <label for="pw">비밀번호 입력</label>
            <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요." required>
        </div>
        <div>
            <label for="name">이름 입력</label>
            <input type="text" id="name" name="name" placeholder="이름을 입력해주세요." required>
        </div>
        <div>
            <label for="tel">전화번호 입력</label>
            <input type="text" id="tel" name="tel" placeholder="전화번호를 입력해주세요." required>
        </div>
        <button type="submit">회원가입</button>
        <a href="../index.jsp" class="btn">취소</a>
    </form>
</div>
</body>
</html>