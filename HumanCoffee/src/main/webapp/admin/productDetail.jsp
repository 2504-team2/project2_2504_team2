<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품 상세</title>
</head>
<body>

<h2>상품 이미지</h2>

<!-- ImageServlet 호출 -->
<img src="<%=request.getContextPath()%>/admin/image?imgId=IMG001" alt="상품 이미지" width="300">

</body>
</html>