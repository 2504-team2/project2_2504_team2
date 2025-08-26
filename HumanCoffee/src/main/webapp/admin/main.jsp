<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="adminMain_container">
    <div class="adminMain_title">관리자 메인 페이지</div>

    <div class="adminMain_buttons">
        <!-- 가맹점 관리 페이지로 이동 -->
        <button type="button" class="adminMain_btn" onclick="location.href='<%= request.getContextPath() %>/index.jsp?next_page=/admin/merchant/merchantManage.jsp'">
            가맹점 관리
        </button>
    </div>
</div>
