<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import = "com.humancoffee.manager.*" %>
<%@ page import = "com.humancoffee.common.*" %>
<%@ page import = "com.humancoffee.model.*" %>
<%@ page import = "com.humancoffee.*" %>
<%@ page import="java.util.Date" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/comhistory_update_form.css" />


<%
HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
ManageComHistorys com = hcInstance.mComHistorys;
int pos = hcInstance.mComHistorys.memory_pos;
List<Com_History> nowCom_HistoryList = new Vector<>(hcInstance.mComHistorys.com_historys[pos]);

// URL 파라미터에서 선택된 연혁 ID 가져오기
String selectedId = request.getParameter("id");
Com_History selectedHistory = null;

// 선택된 ID가 있으면 해당 연혁 데이터 찾기
if (selectedId != null && !selectedId.isEmpty()) {
    for (Com_History history : nowCom_HistoryList) {
        if (selectedId.equals(history.getId())) {
            selectedHistory = history;
            break;
        }
    }
}

// 기본값 설정
String comId = (selectedHistory != null && selectedHistory.getComId() != null) ? selectedHistory.getComId() : "";
String historyId = (selectedHistory != null && selectedHistory.getId() != null) ? selectedHistory.getId() : "";
String startDate = "";
String endDate = "";
String title = (selectedHistory != null && selectedHistory.getTitle() != null) ? selectedHistory.getTitle() : "";
String content = (selectedHistory != null && selectedHistory.getContent() != null) ? selectedHistory.getContent() : "";
int status = (selectedHistory != null) ? selectedHistory.getStatus() : 0;

// 날짜 포맷팅
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
if (selectedHistory != null) {
    if (selectedHistory.getStartDate() != null) {
        startDate = sdf.format(selectedHistory.getStartDate());
    }
    if (selectedHistory.getEndDate() != null) {
        endDate = sdf.format(selectedHistory.getEndDate());
    }
}

// 수정 모드인지 등록 모드인지 결정
String mode = (selectedHistory != null) ? "update" : "insert";
String formTitle = (selectedHistory != null) ? "연혁 정보 수정" : "연혁 정보 입력";
%>

<!-- 연혁 등록/수정 폼 -->
<div class="form-container">
<h3 class="form-title"><%= formTitle %></h3>
<form id="comHistoryForm" method="post" action="comhistory_update.jsp">
<input type="hidden" name="mode" id="mode" value="<%= mode %>">
<input type="hidden" name="originalId" id="originalId" value="<%= historyId %>">

<div class="form-group">
<label for="comId">회사 ID</label>
<input type="text" id="comId" name="comId" value="<%= comId %>" required>
</div>

<div class="form-group">
<label for="historyId">연혁 ID</label>
<input type="text" id="historyId" name="historyId" value="<%= historyId %>" required <%= (selectedHistory != null) ? "readonly" : "" %>>
</div>

<div class="form-group">
<label for="startDate">개업일</label>
<input type="date" id="startDate" name="startDate" value="<%= startDate %>">
</div>

<div class="form-group">
<label for="endDate">폐업일</label>
<input type="date" id="endDate" name="endDate" value="<%= endDate %>">
</div>

<div class="form-group">
<label for="title">기업 활동</label>
<input type="text" id="title" name="title" value="<%= title %>" required>
</div>

<div class="form-group">
<label for="content">내용</label>
<textarea id="content" name="content" rows="4" required><%= content %></textarea>
</div>

<div class="form-group">
<label for="status">상태</label>
<select id="status" name="status" required>
<option value="0" <%= (status == 0) ? "selected" : "" %>>운영중</option>
<option value="1" <%= (status == 1) ? "selected" : "" %>>폐업</option>
</select>
</div>

<div class="form-actions">
<button type="submit" class="btn btn-save">저장</button>
<button type="button" class="btn btn-reset" onclick="goToList()">취소</button>
</div>
</form>
</div>

<script>
// 폼 초기화
function goToList() {
    if (confirm('입력한 내용을 저장하지 않고 목록으로 돌아가시겠습니까?')) {
    	location.href = '<%= request.getContextPath() %>/about/comhistory.jsp';
    }
}

// 폼 유효성 검사
document.getElementById('comHistoryForm').addEventListener('submit', function(e) {
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;
    
    if (startDate && endDate && startDate > endDate) {
        e.preventDefault();
        alert('개업일은 폐업일보다 이전이어야 합니다.');
        return false;
    }
});
</script>