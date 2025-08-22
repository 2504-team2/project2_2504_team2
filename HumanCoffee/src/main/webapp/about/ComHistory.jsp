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
<%
HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
ManageComHistorys com = hcInstance.mComHistorys;
int pos = hcInstance.mComHistorys.memory_pos;

Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
// 현재 회사 히스토리 리스트 가져오기
List<Com_History> nowCom_HistoryList = new Vector<>(hcInstance.mComHistorys.com_historys[pos]);
/*
Com_History test = new Com_History();
test = nowCom_HistoryList.get(0);
//수많은 테스트를 진행하여 최고의 맛을 찾아냈다.
test.setContent("루루루무리머ㅣ랑\n ㄹㄴ덛ㄱ\nㄷ비ㅏㅓ;ㄷ");
com.updateComHistory(test);
*/
int tot_cnt = (nowCom_HistoryList != null) ? nowCom_HistoryList.size() : 0;
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회사 소개</title>
<link rel="stylesheet" href="../css/ComHistory.css" />
</head>
<body>

<div class="container">
    <h1>연혁</h1>

    <div class="company-info-box">
        <table>
            <thead>
                <tr>
                    <th>회사 ID</th>
                    <th>ID</th>
                    <th>개업일</th>
                    <th>폐업일</th>
                    <th>기업활동</th>
                    <th>내용</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (int loop = 0; loop < tot_cnt; loop++) {
                    Com_History history = nowCom_HistoryList.get(loop);
                %>
                <tr>
                    <td><%= (history.getComId() != null) ? history.getComId() : "" %></td>
                    <td><%= (history.getId() != null) ? history.getId() : "" %></td>
 <td><%= (history.getStartDate() != null) ? sdf.format(history.getStartDate()) : "" %></td>
        <td><%= (history.getEndDate() != null) ? sdf.format(history.getEndDate()) : "" %></td>
                    <td><%= (history.getTitle() != null) ? history.getTitle() : "" %></td>
                    <td><%= (history.getContent() != null) ? history.getContent() : "" %></td>
                    <td><%= history.getStatus() %></td>
                 
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
