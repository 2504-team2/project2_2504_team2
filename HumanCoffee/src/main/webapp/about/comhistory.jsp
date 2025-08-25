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
HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
ManageComHistorys com = hcInstance.mComHistorys;
int pos = hcInstance.mComHistorys.memory_pos;

Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

List<Com_History> nowCom_HistoryList = new Vector<>(hcInstance.mComHistorys.com_historys[pos]);
int tot_cnt = (nowCom_HistoryList != null) ? nowCom_HistoryList.size() : 0;
%> 

<div class="container comhistory_container">
    <div class="comhistory_title">연혁</div>

    <div class="comhistory-box comhistory_box">
        <div class="comhistory-header">
            <div class="comhistory-columns">
                <div class="comhistory-column">회사 ID</div>
                <div class="comhistory-column">ID</div>
                <div class="comhistory-column">개업일</div>
                <div class="comhistory-column">폐업일</div>
                <div class="comhistory-column">기업활동</div>
                <div class="comhistory-column">내용</div>
                <div class="comhistory-column">상태</div>
            </div>
        </div>
        <div class="comhistory-body">
            <%
            for (int loop = 0; loop < tot_cnt; loop++) {
                Com_History history = nowCom_HistoryList.get(loop);
            %>
            <div class="comhistory-row">
                <div class="comhistory-cell"><%= (history.getComId() != null) ? history.getComId() : "" %></div>
                <div class="comhistory-cell"><%= (history.getId() != null) ? history.getId() : "" %></div>
                <div class="comhistory-cell"><%= (history.getStartDate() != null) ? sdf.format(history.getStartDate()) : "" %></div>
                <div class="comhistory-cell"><%= (history.getEndDate() != null) ? sdf.format(history.getEndDate()) : "" %></div>
                <div class="comhistory-cell"><%= (history.getTitle() != null) ? history.getTitle() : "" %></div>
                <div class="comhistory-cell"><%= (history.getContent() != null) ? history.getContent() : "" %></div>
                <div class="comhistory-cell"><%= history.getStatus() %></div>
            </div>
            <% } %>
        </div>
    </div>
</div>
