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

<<<<<<< HEAD
  <!-- 메인 페이지 hero 섹션 -->
  <section class="hero-section">
    <div class="hero-video">
      <iframe src="https://www.youtube.com/embed/XlLqJwJHjp0?autoplay=1&mute=1&loop=1&playlist=XlLqJwJHjp0&controls=0&showinfo=0&rel=0&modestbranding=1"
              allow="autoplay; fullscreen"
              allowfullscreen></iframe>
    </div>
    <div class="overlay"></div>
    <div class="hero-content">
      <div class="stats">
        <div class="stat">
          <h3>전국 가맹점 수</h3>
          <p>1,500개</p>
        </div>
        <div class="stat">
          <h3>운영 경력</h3>
          <p id="years">25년</p>
        </div>
      </div>
      <a href="./apply.html" class="btn-apply">창업 신청하기</a>
    </div>
  </section>

  <!-- 메인 콘텐츠 -->
  <div class="main-content">
    <section class="swiper-section">
      <div class="swiper-container mySwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide"><img src="./images/summer.jpg" alt="슬라이드1"></div>
          <div class="swiper-slide"><img src="#" alt="#"></div>
          <div class="swiper-slide"><img src="#" alt="#"></div>
          <div class="swiper-slide"><img src="#" alt="#"></div>
          <div class="swiper-slide"><img src="#" alt="#"></div>
        </div>

        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
      </div>
    </section>
  </div>
=======
	<!-- footer include -->
	<div class="index_bottom_pos">
	  <jsp:include page="./common-jsp/footer.jsp" />
	</div>
>>>>>>> upstream/dev
</div>
</body>
</html>
