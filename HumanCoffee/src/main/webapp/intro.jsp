<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.humancoffee.manager.*" %>
<%@ page import = "com.humancoffee.common.*" %>
<%@ page import = "com.humancoffee.model.*" %>
<%@ page import = "com.humancoffee.*" %>
<%
HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
ManageCompanys com = hcInstance.mCompanys;

int tot_cnt = com.companys[com.memory_pos].size();
Company company;
String Id = "";
String name = "";
String tel = "";
String fax = "";
String addr = "";
String sale_email = "";
String eng_email = "";
Date indate = null;
Date outdate = null;
int status = 0;

/*
for(int loop = 0; loop < tot_cnt; loop++){
	company = com.companys[com.memory_pos].get(loop);
//	if(company.getStatus() == 0)
//		break;
	Id = company.getId();
	name = company.getName();
}
if(loop >= tot_cnt){
	
}
String com_id = company.getId();
*/
/*
String Id = request.getParameter("id");
String name = request.getParameter("name");
String tel = request.getParameter("tel");
String fax = request.getParameter("fax");
String addr = request.getParameter("addr");
String sale_email = request.getParameter("sale_email");
String eng_email = request.getParameter("eng_email");
String indate = request.getParameter("indate");
String outdate = request.getParameter("outdate");
String status = request.getParameter("status");
	*/
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회사 소개</title>
<link rel="stylesheet" href="./css/intro.css" />

</head>
<body>
<div>
<jsp:include page="./common-jsp/header-menu.jsp" />
</div>
<div class="container">
<h1 id="company-title">[회사명]</h1>

<div class="section-header">
    <h2>1. 회사소개</h2>
    <div class="btn-group">
        <button type="button" class="btn btn-register" onclick="registerCompany()">등록</button>
        <button type="button" class="btn btn-edit" onclick="editCompany()">수정</button>
    </div>
</div>

<div class="company-info-box">
<%
	for(int loop = 0; loop < tot_cnt; loop++){
		company = com.companys[com.memory_pos].get(loop);
%>
    <div class="company-info-item">
        <strong>ID:</strong> <span id="company-id"><%= company.getId() %></span>
    </div>
    <div class="company-info-item">
        <strong>회사이름:</strong> <span id="company-name"><%= name %></span>
    </div>
    <div class="company-info-item">
        <strong>tel:</strong> <span id="company-tel"><%= tel %></span>
    </div>
    <div class="company-info-item">
        <strong>fax:</strong> <span id="company-fax"><%= fax %></span>
    </div>
    <div class="company-info-item">
        <strong>회사주소:</strong> <span id="company-addr"><%= addr %></span>
    </div>
    <div class="company-info-item">
        <strong>sale_email:</strong> <span id="company-sale-email"><%= sale_email %></span>
    </div>
    <div class="company-info-item">
        <strong>eng_email:</strong> <span id="company-eng-email"><%= eng_email %></span>
    </div>
    <div class="company-info-item">
        <strong>설립일:</strong> <span id="company-indate"><%= indate %></span>
    </div>
    <div class="company-info-item">
        <strong>종료일:</strong> <span id="company-outdate"><%= outdate %></span>
    </div>
    <div class="company-info-item">
        <strong>상태:</strong> <span id="company-status"><%= status %></span>
    </div>
 <%
	}
 %> 
</div>


</div>
<div>
<jsp:include page="./common-jsp/footer.jsp" />
</div>

<script>
function registerCompany() {
    // 회사 정보 등록 페이지로 이동하거나 모달 창 열기
    // 예: location.href = 'company-register.jsp';
    alert('회사 정보 등록 기능을 구현해주세요.');
}

function editCompany() {
    // 회사 정보 수정 페이지로 이동하거나 모달 창 열기
    // 예: location.href = 'company-edit.jsp';
    alert('회사 정보 수정 기능을 구현해주세요.');
}
</script>
</body>
</html>