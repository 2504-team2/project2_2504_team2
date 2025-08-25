<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="<%=request.getContextPath()%>/js/login.js"></script>
<%@ page import = "java.sql.*" %>
<%
    String id = request.getParameter("id");
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
      } else {
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
  <script>
  	function movePage(form){

  		alert(form); console.log(form);
  		document.getElementById(form).submit();
  	}
  
  </script>
</header>
