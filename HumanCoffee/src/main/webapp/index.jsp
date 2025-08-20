<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- 타이틀 세팅 -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HumanCoffee Korea</title>
  <!-- 파비콘 세팅 -->
  <link rel="icon" href="./favicon.png" />
  <!-- 브라우저 스타일 초기화 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
  <!-- Google Fonts - 나눔고딕 -->
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
  <!-- Google Material Icons -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
  
  <!-- Header CSS 먼저 로드 -->
  <link rel="stylesheet" href="./css/header.css" />
  <!-- Main CSS -->
  <link rel="stylesheet" href="./css/main.css" />
  

  <!-- lodash 자바스크립트 유용한 유틸리티 함수 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
  <!-- animation 처리를 위한 gsap 라이브러리 설치 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js" integrity="sha512-IQLehpLoVS4fNzl7IfH8Iowfm5+RiMGtHykgZJl9AWMgqx0AmJ6cRWcB+GaGVtIsnC4voMfm8f2vwtY+6oPjpQ==" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/ScrollToPlugin.min.js" integrity="sha512-nTHzMQK7lwWt8nL4KF6DhwLHluv6dVq/hNnj2PBN0xMl2KaMm1PM02csx57mmToPAodHmPsipoERRNn4pG7f+Q==" crossorigin="anonymous"></script>
  <!-- swiper 자바스크립트 및 css 라이브러리 설치 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.css" integrity="sha512-aMup4I6BUl0dG4IBb0/f32270a5XP7H1xplAJ80uVKP6ejYCgZWcBudljdsointfHxn5o302Jbnq1FXsBaMuoQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.8.4/swiper-bundle.min.js" integrity="sha512-BABFxitBmYt44N6n1NIJkGOsNaVaCs/GpaJwDktrfkWIBFnMD6p5l9m+Kc/4SLJSJ4mYf+cstX98NYrsG/M9ag==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <!-- javascript -->
  <script defer src="./js/main.js"></script>
  <script defer src="./js/youtube.js"></script>
  <!-- Login JS -->
  <script src="./js/login.js"></script>
</head>
<body>
<div class="desktop">
  <!-- 헤더 영역 - JSP include로 직접 삽입 (header 태그 중복 제거) -->
  <jsp:include page="./common-jsp/header-menu.jsp" />

  <!-- 메인 페이지 hero 섹션 -->
  <section class="hero-section">
    <!-- YouTube 배경 -->
    <div class="hero-video">
      <iframe src="https://www.youtube.com/embed/XlLqJwJHjp0?autoplay=1&mute=1&loop=1&playlist=XlLqJwJHjp0&controls=0&showinfo=0&rel=0&modestbranding=1"
              allow="autoplay; fullscreen"
              allowfullscreen></iframe>
    </div>
    <!-- 오버레이 -->
    <div class="overlay"></div>
    <!-- 콘텐츠 -->
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
    <!-- 이미지 슬라이드 -->
    <section class="swiper-section">
      <div class="swiper-container mySwiper">
        <div class="swiper-wrapper">
          <!-- 각 슬라이드 -->
          <div class="swiper-slide">
            <img src="./images/summer.jpg" alt="슬라이드1">
          </div>
          <div class="swiper-slide">
            <img src="https://via.placeholder.com/800x300/c8102e/ffffff?text=Holiday+Edition" alt="홀리데이 에디션">
          </div>
          <div class="swiper-slide">
            <img src="https://via.placeholder.com/800x300/f4a261/ffffff?text=New+Menu" alt="신메뉴">
          </div>
          <div class="swiper-slide">
            <img src="https://via.placeholder.com/800x300/2a9d8f/ffffff?text=Membership+Benefits" alt="멤버십 혜택">
          </div>
          <div class="swiper-slide">
            <img src="https://via.placeholder.com/800x300/e76f51/ffffff?text=Store+Location" alt="매장 안내">
          </div>            
        </div>

        <!-- 네비게이션 버튼 -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>

        <!-- 페이지네이션 (동그라미 표시) -->
        <div class="swiper-pagination"></div>
      </div>
    </section>
  </div>
</div>

<div>
  <jsp:include page="./common-jsp/footer.jsp" />
</div>

</body>
</html>