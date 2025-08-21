<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import = "com.humancoffee.manager.*" %>
<%@ page import = "com.humancoffee.model.*" %>
<%@ page import = "com.humancoffee.common.*" %>
<%@ page import = "com.humancoffee.*" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/merchantList.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<%
    // ServletContext에서 HumanCoffee 객체를 가져옴
    HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");

    if(hcInstance != null){
        // HumanCoffee 객체로부터 ManageSubComs 객체 가져오기
        ManageSubComs mSubComs = hcInstance.mSubComs;

        List<Sub_Com> merchantList = mSubComs.sub_coms[mSubComs.memory_pos];
%>

<jsp:include page="/common-jsp/header-menu.jsp" />
<main class="merchant-list-page">
    <div class="inner">
        <h1>가맹점 리스트</h1>
        <div class="merchant-grid">
            <%
                if (merchantList != null && !merchantList.isEmpty()) {
                    for (Sub_Com sub_com : merchantList) {
            %>
            <div class="merchant-card">
                <img src="<%= request.getContextPath() %>/images/store_default.jpg" alt="<%=sub_com.getName()%>" />
                <div class="info">
                    <h2><%=sub_com.getName()%></h2>
                    <p><%=sub_com.getAddr()%></p>
                    <p>전화: <%=sub_com.getTel()%></p>
                    <p>이메일: <%=sub_com.getEmail()%></p>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <p>등록된 가맹점이 없습니다.</p>
            <%
                }
            %>
        </div>
    </div>
</main>

<%
    } else {
%>
<p>가맹점 데이터를 가져올 수 없습니다. HumanCoffee 객체가 null입니다.</p>
<%
    }
%>
