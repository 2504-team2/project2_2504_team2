<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="<%=request.getContextPath()%>/js/login.js"></script>
<%@ page import = "java.sql.*" %>
<%
    String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	Integer rollObj = (Integer) session.getAttribute("roll");
	System.out.println("session roll: " + session.getAttribute("roll"));
	System.out.println("session obj roll: " + rollObj);
	String div = (String) session.getAttribute("div");
	Integer pointObj = (Integer) session.getAttribute("point");
	Integer couponObj = (Integer) session.getAttribute("coupon");
	
	// null 체크 후 int 변환
	int roll = (rollObj != null) ? rollObj.intValue() : 0;
    int point = (pointObj != null) ? pointObj.intValue() : 0;
    int coupon = (couponObj != null) ? couponObj.intValue() : 0;
%> 

<header>
  <div class="header">
    <a href="<%= request.getContextPath() %>/index.jsp" class="logo">
      <img src="<%= request.getContextPath() %>/images/HumanCoffee_Logo.png" alt="HumanCoffee" />
    </a>
    <ul class="main-menu">
      <li class="item">
        <div class="item__name">회사소개</div>
        <div class="item__contents">
          <div class="contents__menu">
            <ul class="inner">
              <li>
                  <ul>
                  <li><a href="<%= request.getContextPath() %>/index.jsp?next_page=/about/company.jsp">휴먼커피에 대하여</a></li>
                  <li><a href="<%= request.getContextPath() %>/index.jsp?next_page=/about/comhistory.jsp">연혁</a></li>
                  <li><a href="<%= request.getContextPath() %>/index.jsp?next_page=/about/map.jsp">오시는 길</a></li>
                </ul>
               </li>
            </ul>
          </div>
        </div>
      </li>
      <li class="item">
        <div class="item__name">제품</div>
        <div class="item__contents">
          <div class="contents__menu">
            <ul class="inner">
               <li>
                <ul>
                  <li><a href="<%= request.getContextPath() %>/index.jsp?next_page=/menu/menu-coffee.jsp">커피</a></li>
                  <li><a href="<%= request.getContextPath() %>/index.jsp?next_page=/menu/menu-dikapein.jsp">디카페인</a></li>
                  <li><a href="<%= request.getContextPath() %>/index.jsp?next_page=/menu/menu-juice.jsp">쥬스</a></li>
                 </ul>
              </li>
            </ul>
          </div>
        </div>
      </li>
      <li class="item">
        <div class="item__name">가맹점</div>
        <div class="item__contents">
          <div class="contents__menu">
            <ul class="inner">
              <li>
                <ul>
                  <li><a href="<%= request.getContextPath() %>/index.jsp?next_page=/merchant/merchantList.jsp">가맹점 리스트</a></li>
                  <li><a href="<%= request.getContextPath() %>/index.jsp?next_page=/merchant/merchantApply.jsp">창업신청</a></li>
                </ul>
                </li>
            </ul>
          </div>
        </div>
      </li>
    </ul>

    <div class="loginService">
      <%
      if (session.getAttribute("id") == null || session.getAttribute("id").equals("")) {
      %>
        <a href="<%= request.getContextPath() %>/loginService/login_form.jsp" class="btn">로그인</a>
      <%
      // 일반 사용자 로그인
      } else if (div.equals("customer")) {
      %>
        <div class="id-info">
          <span>쿠폰: <%= coupon %>개</span>
          <span>point: <%= point %></span>
          <span>이용자: <%= name %></span>
          <a href="javascript: Logout();" class="btn">로그아웃</a>
        </div>
      <%
      } else {
      %>
      	<div class="id-info">
      		<%
		     if (roll == 0) {
		    %>
          		<span>직책: 일반</span>
          	<%
		     } else if (roll == 1) {
		    %>
		    	<span>직책: 상품 등록 및 관리</span>
		    <%
		     } else if (roll == 2) {
		    %>
		    	<span>직책: 가맹점 등록 및 관리</span>
		    <%
		     } else if (roll == 3) {
		    %>
		    	<span>직책: 상품 및 가맹점 등록 및 관리</span>
		    <%
		     } else if (roll == 4) {
		    %>
		    	<span>직책: 본사 관리 및 매출현황 관리</span>
		    <%
		     } else if (roll == 5) {
		    %>
		    	<span>직책: 상품 및 본사 등록 및 관리 매출현황 관리</span>
		    <%
		     } else if (roll == 6) {
		    %>
		    	<span>직책: 가맹점 및 본사 등록 및 관리 매출현황 관리</span>
		    <%
		     } else if (roll == 7) {
		    %>
		    	<span>직책: 총괄 관리</span>
		    <%
		     } else {
		    %>
		    	<span>직책: 기타</span>
		    <%
		     }
		    %>
          <span>관리자: <%= name %></span>
          <a href="javascript: Logout();" class="btn">로그아웃</a>
        </div>
       <%
      }
      %>
    </div>

  </div>
  <script>
  	function movePage(form){

  		alert(form); console.log(form);
  		document.getElementById(form).submit();
  	}
  
  </script>
</header>
