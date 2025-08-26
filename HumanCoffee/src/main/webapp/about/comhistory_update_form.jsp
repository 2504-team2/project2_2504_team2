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
<link rel="stylesheet" href="../css/comhistory_update_form.css" />

<%


HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
ManageComHistorys com = hcInstance.mComHistorys;
int pos = hcInstance.mComHistorys.memory_pos;
List<Com_History> nowCom_HistoryList = new Vector<>(hcInstance.mComHistorys.com_historys[pos]);
Com_History comcom = new Com_History();
String com_id = null;
String id = null;
String startdate = null;
String enddate = null;
String title = null;
String content = null;


%>

<!-- 연혁 등록/수정 폼 -->
<div class="form-container">
    <h3 class="form-title">연혁 정보 입력</h3>
    <form id="comHistoryForm" method="post" action="comhistory_update.jsp">
        <input type="hidden" name="mode" id="mode" value="insert">
        <input type="hidden" name="originalId" id="originalId">

        <div class="form-group">
            <label for="comId">회사 ID</label>
            <input type="text" id="comId"  value="<%= request.getParameter("comId") %>">
        </div>

        <div class="form-group">
            <label for="historyId">연혁 ID</label>
            <input type="text" id="historyId"  value="<%= request.getParameter("id") %>">
        </div>

        <div class="form-group">
            <label for="startDate">개업일</label>
            <input type="date" id="startDate" value="<%= request.getParameter("startDate") %>">
        </div>

        <div class="form-group">
            <label for="endDate">폐업일</label>
            <input type="date" id="endDate"  value="<%= request.getParameter("endDate") %>">
        </div>

        <div class="form-group">
            <label for="title">기업 활동</label>
            <input type="text" id="title"  value="<%= request.getParameter("title") %>" >
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content"  rows="4" value="<%= request.getParameter("content") %>"></textarea>
        </div>

        <div class="form-group">
            <label for="status">상태</label>
            <select id="status" >
                <option value="0">운영중</option>
                <option value="1">폐업</option>
            </select>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn btn-save">저장</button>
            <button type="button" class="btn btn-reset" onclick="resetForm()">취소</button>
        </div>
    </form>
</div>