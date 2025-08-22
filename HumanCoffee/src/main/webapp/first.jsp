<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<!-- Swiper CSS를 먼저 로드 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.css">
<!-- 그 다음에 커스텀 CSS 로드 -->
<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/main.css" />

<!-- JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js"></script>
<script defer src="./js/main.js"></script>
<script defer src="./js/youtube.js"></script>
<script src="./js/login.js"></script> 

</head>
<body>
<div class="desktop">

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
          <div class="swiper-slide"><img src="https://via.placeholder.com/800x300/c8102e/ffffff?text=Holiday+Edition" alt="홀리데이 에디션"></div>
          <div class="swiper-slide"><img src="https://via.placeholder.com/800x300/f4a261/ffffff?text=New+Menu" alt="신메뉴"></div>
          <div class="swiper-slide"><img src="https://via.placeholder.com/800x300/2a9d8f/ffffff?text=Membership+Benefits" alt="멤버십 혜택"></div>
          <div class="swiper-slide"><img src="https://via.placeholder.com/800x300/e76f51/ffffff?text=Store+Location" alt="매장 안내"></div>
        </div>

        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
      </div>
    </section>
  </div>

</body>
</html>
