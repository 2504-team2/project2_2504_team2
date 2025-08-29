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
<link rel="stylesheet" href="../css/comhistory.css" />

<%
//세션에서 권한 정보 가져오기
String div = (String) session.getAttribute("div");
Integer rollObj = (Integer) session.getAttribute("roll");
int roll = (rollObj != null) ? rollObj.intValue() : 0;

//관리 권한 체크 (4, 5, 6, 7번 권한만 등록/수정/삭제 가능)
boolean ManageCheck = (roll == 4 || roll == 5 || roll == 6 || roll == 7);

HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
ManageComHistorys com = hcInstance.mComHistorys;
int pos = hcInstance.mComHistorys.memory_pos;

Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

List<Com_History> nowCom_HistoryList = new Vector<>(hcInstance.mComHistorys.com_historys[pos]);
int tot_cnt = (nowCom_HistoryList != null) ? nowCom_HistoryList.size() : 0;
%>

<div class="container comhistory_container">
<div class="comhistory_title">연혁 관리</div>

<!-- 연혁 등록/수정 폼 -->
<div class="comhistory-box comhistory_box">
<!-- 연혁 목록 테이블 -->
<div class="comhistory-list-box">
    <div class="list-header">
        <h3 class="list-title">연혁 목록 <span class="record-count">(총 <%= tot_cnt %>건)</span></h3>
        <a href="<%= request.getContextPath() %>/about/manageHistory/comhistory_insert_form.jsp"><button class="btn btn-search">등록</button></a>
        <div class="search-box">
            <input type="text" id="searchInput" class="search-input" placeholder="검색어를 입력하세요">
            <button type="button" class="btn btn-search" onclick="searchHistory()">검색</button>
        </div>
    </div>
    
    <div class="table-container">
        <div class="table-header">
            <div class="table-columns">
                <div class="table-column">회사 ID</div>
                <div class="table-column">ID</div>
                <div class="table-column">개업일</div>
                <div class="table-column">폐업일</div>
                <div class="table-column">기업활동</div>
                <div class="table-column">내용</div>
                <div class="table-column">상태</div>
                <div class="table-column">관리</div>
            </div>
        </div>
        
        <div class="table-body" id="historyTableBody">
            <%
            if (tot_cnt == 0) {
            %>
            <div class="empty-state">
                등록된 연혁이 없습니다.
            </div>
            <%
            } else {
                for (int loop = 0; loop < tot_cnt; loop++) {
                    Com_History history = nowCom_HistoryList.get(loop);
            %>
            <div class="table-row" data-id="<%= history.getId() %>">
                <div class="table-cell" name="comId"><%= (history.getComId() != null) ? history.getComId() : "" %></div>
                <div class="table-cell" name="id"><%= (history.getId() != null) ? history.getId() : "" %></div>
                <div class="table-cell" name="startDate"><%= (history.getStartDate() != null) ? sdf.format(history.getStartDate()) : "" %></div>
                <div class="table-cell" name="endDate"><%= (history.getEndDate() != null) ? sdf.format(history.getEndDate()) : "" %></div>
                <div class="table-cell" name="title"><%= (history.getTitle() != null) ? history.getTitle() : "" %></div>
                <div class="table-cell content-cell" name="content" title="<%= (history.getContent() != null) ? history.getContent() : "" %>">
                    <%= (history.getContent() != null) ? history.getContent() : "" %>
                </div>
                <div class="table-cell">
                    <span class="status-badge status-<%= history.getStatus() %>"><%= (history.getStatus() == 0) ? "운영중" : "폐업" %></span>
                </div>

            <div class="table-cell">
    <div class="btn-group">
       <a href="<%= request.getContextPath() %>/about/manageHistory/comhistory_update_form.jsp">
            <button class="btn btn-edit">수정</button>
        </a>
    </div>
</div>
            </div>
            <%
                }
            }
            %>
        </div>
    </div>
</div>
</div>

<script>
// 폼 초기화
function resetForm() {
    document.getElementById('comHistoryForm').reset();
    document.getElementById('mode').value = 'insert';
    document.getElementById('originalId').value = '';
    document.querySelector('.form-title').textContent = '연혁 정보 입력';
}

// 연혁 수정
function editHistory(historyId) {
    // AJAX를 통해 해당 연혁 정보를 가져와서 폼에 채움
    fetch('getComHistory.jsp?id=' + historyId)
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                const history = data.history;
                document.getElementById('comId').value = history.comId || '';
                document.getElementById('historyId').value = history.id || '';
                document.getElementById('startDate').value = history.startDate || '';
                document.getElementById('endDate').value = history.endDate || '';
                document.getElementById('title').value = history.title || '';
                document.getElementById('content').value = history.content || '';
                document.getElementById('status').value = history.status || '';
                
                document.getElementById('mode').value = 'update';
                document.getElementById('originalId').value = historyId;
                document.querySelector('.form-title').textContent = '연혁 정보 수정';
                
                // 폼 위치로 스크롤
                document.querySelector('.comhistory_box').scrollIntoView({ behavior: 'smooth' });
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('연혁 정보를 불러오는 중 오류가 발생했습니다.');
        });
}

// 연혁 삭제
function deleteHistory(historyId) {
    if (confirm('정말로 이 연혁을 삭제하시겠습니까?')) {
        fetch('deleteComHistory.jsp', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'id=' + encodeURIComponent(historyId)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('연혁이 성공적으로 삭제되었습니다.');
                location.reload();
            } else {
                alert('삭제 중 오류가 발생했습니다: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('삭제 중 오류가 발생했습니다.');
        });
    }
}

// 검색 기능
function searchHistory() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const rows = document.querySelectorAll('.table-row');
    
    rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        if (text.includes(searchTerm)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}

// 엔터키로 검색
document.getElementById('searchInput').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        searchHistory();
    }
});

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