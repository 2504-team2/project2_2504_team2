<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>    
<%
	String next_page = request.getParameter("page");
	System.out.println("rcv : " + next_page);
	if(next_page == null || next_page.isEmpty())
		next_page = "./first.jsp";
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HumanCoffee Korea</title>
<link rel="stylesheet" href="./css/index.css" />
</head>
<body>
<div class="index_desktop">
	<div class="index_top_pos">
	  <!-- header-menu.jsp include (경로 수정, 중복 <header> 제거) -->
	  <jsp:include page="./common-jsp/header-menu.jsp" />
	</div>
  
  	<div class="index_middle_pos">
<%
if (next_page != null && !next_page.isEmpty()) {
%>
    <jsp:include page="<%= next_page %>" />
<%
} else {
%>
    <jsp:include page="./first.jsp" />
<%
}
%>

	</div>

	<!-- footer include -->
	<div class="index_bottom_pos">
	  <jsp:include page="./common-jsp/footer.jsp" />
	</div>
</div>
</body>
</html>
