<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- javascript -->
<script defer src="./js/main.js"></script>
<script defer src="./js/youtube.js"></script>
<!-- css -->
<link rel="stylesheet" href="/css/main.css" />
<%
	String searchKeyword = request.getParameter("search");
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
                  <li><a href="#">휴먼커피에 대하여</a></li>
                  <li><a href="#">연혁</a></li>
                  <li><a href="#">오시는 길</a></li>
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
                  <li><a href="#">커피</a></li>
                  <li><a href="#">디카페인</a></li>
                  <li><a href="#">쥬스</a></li>
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
                  <li><a href="#">가맹점 리스트</a></li>
                  <li><a href="#">창업신청</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </li>
    </ul>      

<%
	if (session.getAttribute("id") == null || session.getAttribute("id").equals("")) {
		
%>	
	<a href="./login_form.jsp" class="btn">로그인</a>
<%
	} else {
%>	
	<span>사용자: <%= id %></span>
	<a href="javascript: Logout();" class="btn">로그아웃</a>
<%
	}
%>
  </div>
</header>