<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      <!-- custom css -->
  <link rel="stylesheet" href="../css/first.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.4.5/swiper-bundle.min.css" />
</head>
<body>
    <div class="desktop">

  <!-- 메인 페이지 hero 섹션 -->
<section class="hero-section">
  <!-- YouTube 배경 -->
  <div class="hero-video">
    <iframe src="https://www.youtube.com/embed/VIDEO_ID?autoplay=1&mute=1&loop=1&playlist=XlLqJwJHjp0"
            frameborder="0"
            allow="autoplay; fullscreen"
            allowfullscreen></iframe>
  </div>

  <!-- 오버레이 -->
  <div class="overlay"></div>

  <!-- 콘텐츠 -->
  <div class="hero-content">
    <div class="stats">
      <div class="stat">
        <h3>가맹점 수</h3>
        <p>150개</p>
      </div>
      <div class="stat">
        <h3>기술 경력</h3>
        <p id="years"></p>
      </div>
    </div>
    <a href="./apply.html" class="btn-apply">창업 신청</a>
  </div>
</section>

<div class="main">
  <!-- 이미지 슬라이드 -->
  <div class="swiper-container mySwiper">
    <div class="swiper-wrapper">
      <!-- 각 슬라이드 -->
      <div class="swiper-slide">
        <img src="../images/summer.jpg" alt="슬라이드1">
      </div>
      <div class="swiper-slide">
        <img src="./images" alt="슬라이드2">
      </div>
      <div class="swiper-slide">
        <img src="./images" alt="슬라이드3">
      </div>
      <div class="swiper-slide">
        <img src="./images" alt="슬라이드4">
      </div>
      <div class="swiper-slide">
        <img src="./images" alt="슬라이드5">
      </div>            
    </div>

    <!-- 네비게이션 버튼 -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>

    <!-- 페이지네이션 (동그라미 표시) -->
    <div class="swiper-pagination"></div>
  </div>
</div>
</div>

</body>
</html>