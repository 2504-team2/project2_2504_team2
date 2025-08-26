<!-- productForm.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 등록</title>
</head>
<body>
<h2>상품 등록</h2>
<form action="productUpload" method="post" enctype="multipart/form-data">
    상품명: <input type="text" name="name" required><br>
    가격: <input type="number" name="price" required><br>
    카테고리: <input type="text" name="category" required><br>
    이미지: <input type="file" name="image" accept="image/*" required><br>
    <button type="submit">등록</button>
</form>
</body>
</html>
