<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>창업 신청하기</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/merchantApply.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
</head>
<body>
<jsp:include page="/common-jsp/header.jsp" />
<div class="merchant-list-page">
    <div class="inner">
        <h1>가맹점 창업 신청하기</h1>

        <form action="./Apply.jsp" method="post" class="merchant-form">
            <div class="form-group">
                <label for="name">가맹점 명</label>
                <input type="text" id="name" name="name" placeholder="가맹점 이름 입력" required />
            </div>
            
            <div class="form-group">
                <label for="tel">대표 전화</label>
                <input type="tel" id="tel" name="tel" placeholder="010-1234-5678" required />
            </div>
			<div class="form-group">
			    <label for="fax">팩스 번호</label>
			    <input type="tel" id="fax" name="fax" placeholder="02-3015-1106" />
			</div>
            <div class="form-group">
                <label for="addr">주소</label>
                <input type="text" id="addr" name="addr" placeholder="도로명/상세주소" required />
            </div>

            <div class="form-group">
                <label for="email">대표 이메일</label>
                <input type="email" id="email" name="email" placeholder="example@domain.com" required />
            </div>

            <div class="form-group">
                <label for="indate">창립일</label>
                <input type="date" id="indate" name="indate" required />
            </div>

            <div class="form-group submit-group">
                <button type="submit">신청하기</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>