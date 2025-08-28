<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="merchantModal" class="modal-overlay">
    <div class="modal-content">
        <!-- 좌우 레이아웃 -->
        <div class="modal-left">
            <img id="modalImg" src="" alt="가맹점 이미지" />
            <h2 id="modalName"></h2>
            <p id="modalAddr"></p>
            <p id="modalTel"></p>
            <p id="modalEmail"></p>
            <button class="close-btn" onclick="closeMerchantModal()">닫기</button>
        </div>
        <div class="modal-right">
            <div class="map-container">
                <iframe id="modalMap"
                        class="embedded-map"
                        src=""
                        width="100%"
                        height="100%"
                        style="border:0;"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </div>
    </div>
</div>
