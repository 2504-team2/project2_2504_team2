<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- custom css -->
<link rel="stylesheet" href="./css/header.css" />
<!-- 로그인 기능 관련 JS -->
<script src="<%=request.getContextPath()%>/js/login.js"></script>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.HumanCoffee.DBManager" %>
<%
	String id = request.getParameter("id");
%> 
<header>
  <div class="inner">
    <a href="./index.jsp" class="logo">
      <img src="./images/HumanCoffee_Logo.png" alt="HumanCoffee" />
    </a>

    <ul class="main-menu">
      <li class="item">
        <div class="item__name">회사소개</div>
        <div class="item__contents">
          <div class="contents__menu">
            <ul class="inner">
              <li>
                <ul>
                  <a href= "#">
                  	<li>휴먼커피에 대하여</li>
                  </a>
                  <a href= "#">
                  	<li>연혁</li>
                  </a>
                  <a href= "#">
                  	<li>오시는 길</li>
                  </a>
                </ul>
              </li>
            </ul>
          </div>
      </li>
      <li class="item">
        <div class="item__name">제품</div>
        <div class="item__contents">
          <div class="contents__menu">
            <ul class="inner">
              <li>
                <ul>
                  <a href= "#">
                  	<li>커피</li>
                  </a>
                  <a href= "#">
                  	<li>디카페인</li>
                  </a>
                  <a href= "#">
                  	<li>쥬스</li>
                  </a>         
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </li>
      <li class="item">
        <div class="item__name">가맹정</div>
        <div class="item__contents">
          <div class="contents__menu">
            <ul class="inner">
              <li>
                <ul>
                  <a href= "#">
                  	<li>가맹점 리스트</li>
                  </a>
                  <a href= "#">
                  	<li>창업신청</li>
                  </a>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </li>
    </ul>      
	
	<div class="loginService">
		<%
		// 비로그인시 로그인 버튼을 활성화
		if (session.getAttribute("id") == null || session.getAttribute("id").equals(""))
		{
		%>
		<a href="./loginService/login_form.jsp" class="btn">로그인</a>
		<%
		} else {
			// 로그인시 id를 표시, 로그아웃 버튼을 활성화
			id = (String) session.getAttribute("id");
		%>
			<div class="id-info">
				<span>이용자: <%= id %></span>
				<a href="javascript: Logout();" class="btn">로그아웃</a>
			</div>
			<%
			}
			%>
		</div>
	</div>
</header>