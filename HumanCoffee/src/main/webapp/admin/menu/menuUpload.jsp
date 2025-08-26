<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메뉴 업로드</title>
</head>
<body>
    <h1>메뉴 업로드</h1>
<form action="${pageContext.request.contextPath}/menuUpload" method="post" enctype="multipart/form-data">
        이름: <input type="text" name="name"><br><br>
        가격: <input type="text" name="price"><br><br>
        카테고리: <input type="text" name="category"><br><br>
        이미지: <input type="file" name="image"><br><br>
        <button type="submit">업로드</button>
    </form>
</body>
</html>
