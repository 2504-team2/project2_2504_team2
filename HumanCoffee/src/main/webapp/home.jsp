<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="home_container">
        <section class="home_hero-section">
            <div class="home_hero-video">
                <iframe src="https://www.youtube.com/embed/XlLqJwJHjp0?autoplay=1&mute=1&loop=1&playlist=XlLqJwJHjp0&controls=0&showinfo=0&rel=0&modestbranding=1"
                        allow="autoplay; fullscreen"
                        allowfullscreen></iframe>
            </div>
            <div class="home_overlay"></div>
            <div class="home_hero-content">
                <div class="home_stats">
                    <div class="home_stat">
                        <h3>전국 가맹점 수</h3>
                        <p>1,500개</p>
                    </div>
                    <div class="home_stat">
                        <h3>운영 경력</h3>
                        <p id="years">25년</p>
                    </div>
                </div>
                <form action="<%= request.getContextPath() %>/" method="post">
					<input type="hidden" name="next_page" value="/merchant/merchantApply.jsp" />
					<button type="submit" class="home_btn-apply">창업신청</button>
				</form>
            </div>
        </section>
        
        <div class="home_main-content">
            <section class="home_swiper-section">
                <!-- Swiper 구조 수정: swiper-wrapper 클래스 사용 -->
                <div class="swiper mySwiper home_swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide home_swiper-slide">
                            <img src="./images/summer.jpg" alt="슬라이드1">
                        </div>
                        <div class="swiper-slide home_swiper-slide">
                            <img src="https://via.placeholder.com/800x300/c8102e/ffffff?text=Holiday+Edition" alt="홀리데이 에디션">
                        </div>
                        <div class="swiper-slide home_swiper-slide">
                            <img src="https://via.placeholder.com/800x300/f4a261/ffffff?text=New+Menu" alt="신메뉴">
                        </div>
                        <div class="swiper-slide home_swiper-slide">
                            <img src="https://via.placeholder.com/800x300/2a9d8f/ffffff?text=Membership+Benefits" alt="멤버십 혜택">
                        </div>
                        <div class="swiper-slide home_swiper-slide">
                            <img src="https://via.placeholder.com/800x300/e76f51/ffffff?text=Store+Location" alt="매장 안내">
                        </div>
                    </div>

                    <div class="home_swiper-button-next"></div>
                    <div class="home_swiper-button-prev"></div>
                    <div class="home_swiper-pagination"></div>
                </div>
            </section>
        </div>

      </div>
      <form action="<%= request.getContextPath() %>/" method="post">
			<input type="hidden" name="next_page" value="/merchant/merchantApply.jsp" />
			<button type="submit" class="home_btn-apply">창업신청</button>
	  </form>

    </div>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <!-- 커스텀 JS -->
    <script src="./js/home.js"></script>