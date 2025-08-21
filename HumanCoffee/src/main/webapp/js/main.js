// Swiper 초기화
document.addEventListener('DOMContentLoaded', function() {
    const swiper = new Swiper('.mySwiper', {
        // 슬라이드 설정
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,

        // 자동 재생
        autoplay: {
            delay: 4000,
            disableOnInteraction: false,
        },

        // 페이지네이션
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },

        // 네비게이션 버튼
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },

        // 반응형
        breakpoints: {
            768: {
                slidesPerView: 1,
                spaceBetween: 40,
            },
            1024: {
                slidesPerView: 1,
                spaceBetween: 50,
            },
        },

        // 효과
        effect: 'fade',
        fadeEffect: {
            crossFade: true
        }
    });

    // 기본 네비게이션 버튼 스타일 완전 제거 및 커스텀 화살표 적용
    setTimeout(() => {
        const nextBtn = document.querySelector('.swiper-button-next');
        const prevBtn = document.querySelector('.swiper-button-prev');
        
        if (nextBtn) {
            // 기본 스타일 제거
            nextBtn.innerHTML = '';
            nextBtn.style.color = 'transparent';
            nextBtn.style.fontSize = '0';
            
            // 커스텀 화살표 추가
            const nextArrow = document.createElement('div');
            nextArrow.className = 'custom-arrow custom-arrow-next';
            nextBtn.appendChild(nextArrow);
        }
        
        if (prevBtn) {
            // 기본 스타일 제거
            prevBtn.innerHTML = '';
            prevBtn.style.color = 'transparent';
            prevBtn.style.fontSize = '0';
            
            // 커스텀 화살표 추가
            const prevArrow = document.createElement('div');
            prevArrow.className = 'custom-arrow custom-arrow-prev';
            prevBtn.appendChild(prevArrow);
        }
    }, 100);

    // 검색 기능
    const searchEl = document.querySelector('.search');
    if (searchEl) {
        const searchInputEl = searchEl.querySelector('input');
        
        if (searchInputEl) {
            searchEl.addEventListener('click', function() {
                searchInputEl.focus();
            });

            searchInputEl.addEventListener('focus', function() {
                searchEl.classList.add('focused');
                searchInputEl.setAttribute('placeholder', '통합검색');
            });

            searchInputEl.addEventListener('blur', function() {
                searchEl.classList.remove('focused');
                searchInputEl.setAttribute('placeholder', '');
            });
        }
    }

    // 현재 년도 표시
    const thisYear = document.querySelector('.this-year');
    if (thisYear) {
        thisYear.textContent = new Date().getFullYear();
    }

    // 경력 년수 계산 (1999년 창립 기준)
    const yearsEl = document.getElementById('years');
    if (yearsEl) {
        const currentYear = new Date().getFullYear();
        const foundedYear = 1999;
        const years = currentYear - foundedYear;
        yearsEl.textContent = years + '년';
    }
});

// 스크롤 효과
window.addEventListener('scroll', function() {
    const header = document.querySelector('header');
    if (header) {
        if (window.scrollY > 100) {
            header.style.background = 'rgba(246, 245, 240, 0.95)';
            header.style.backdropFilter = 'blur(10px)';
        } else {
            header.style.background = '#F6F5F0';
            header.style.backdropFilter = 'none';
        }
    }
});