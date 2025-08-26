<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.humancoffee.manager.*" %>
<%@ page import="com.humancoffee.common.*" %>
<%@ page import="com.humancoffee.model.*" %>
<%@ page import="com.humancoffee.*" %>

<%
request.setCharacterEncoding("UTF-8");

try {
    // 1. 파라미터 받기 (폼 name과 일치)
    String comId     = request.getParameter("comId");
    String historyId = request.getParameter("id");   // ✅ name="id"
    String startDate = request.getParameter("startDate");
    String endDate   = request.getParameter("endDate");
    String title     = request.getParameter("title");
    String content   = request.getParameter("content");
    String status    = request.getParameter("status");

    // 2. ID 필수 체크
    if (historyId == null || historyId.trim().isEmpty()) {
        out.println("<script>alert('History ID는 필수입니다.'); history.back();</script>");
        return;
    }

    // 3. HumanCoffee 인스턴스 가져오기
    HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
    ManageComHistorys com = hcInstance.mComHistorys;
    int pos = com.memory_pos;

    // 4. 기존 데이터 조회
    Com_History searchHistory = new Com_History();
    searchHistory.setId(historyId.trim());
    Com_History existingHistory = com.searchComHistoryById(searchHistory);

    if (existingHistory == null) {
        out.println("<script>alert('해당 ID의 기록이 존재하지 않습니다.'); history.back();</script>");
        return;
    }

    // 5. 수정할 Com_History 객체 생성
    Com_History updateHistory = new Com_History();
    updateHistory.setId(historyId.trim());
    updateHistory.setComId((comId != null && !comId.trim().isEmpty()) ? comId.trim() : existingHistory.getComId());
    updateHistory.setTitle((title != null && !title.trim().isEmpty()) ? title.trim() : existingHistory.getTitle());
    updateHistory.setContent((content != null && !content.trim().isEmpty()) ? content : existingHistory.getContent());

    // 시작일 처리
    if (startDate != null && !startDate.trim().isEmpty()) {
        updateHistory.setStartDate(java.sql.Date.valueOf(startDate.trim()));   // yyyy-MM-dd 포맷
    } else {
        updateHistory.setStartDate(existingHistory.getStartDate());
    }

    // 종료일 처리
    if (endDate != null && !endDate.trim().isEmpty()) {
        updateHistory.setEndDate(java.sql.Date.valueOf(endDate.trim()));
    } else {
        updateHistory.setEndDate(existingHistory.getEndDate());
    }

    // 상태 처리
    if (status != null && !status.trim().isEmpty()) {
        updateHistory.setStatus(Byte.parseByte(status.trim()));   // DB/모델이 byte라면 이렇게 변환
    } else {
        updateHistory.setStatus(existingHistory.getStatus());
    }

    // 6. DB 업데이트 실행
    com.updateComHistory(updateHistory);

    // 7. 메모리의 리스트도 업데이트
    List<Com_History> nowCom_HistoryList = com.com_historys[pos];
    for (int i = 0; i < nowCom_HistoryList.size(); i++) {
        if (nowCom_HistoryList.get(i).getId().equals(historyId)) {
            nowCom_HistoryList.set(i, updateHistory);
            break;
        }
    }

    // 8. 완료 후 목록으로 리다이렉트
    response.sendRedirect("comhistory_list.jsp");

} catch (Exception e) {
    e.printStackTrace(); // 서버 콘솔에 로그 남김
    out.println("<script>alert('수정 중 오류 발생: " + e.getMessage() + "'); history.back();</script>");
}
%>
