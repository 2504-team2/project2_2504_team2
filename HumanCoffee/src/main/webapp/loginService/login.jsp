<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.humancoffee.DBManager" %>

<%
	// out 내장객체로 웹 페이지 출력
	out.println("<h1>로그인 처리중입니다</h1>");

	// post로 요청한 파라미터 조회 - 파라미터 이름 수정
	String Id = request.getParameter("id");
	String password = request.getParameter("pw");
	
	// 파라미터로 전달받은 데이터들을 DB에 저장
	Connection conn = DBManager.getDBConnection();
	Exception ex1 = null;
	try {
		String selectSql = "SELECT ID FROM CUSTOMER "
			+ "WHERE ID = ? AND PWD = ? ";
		
		//PreparedStatement 얻기 및 값 지정
		PreparedStatement pstmt = conn.prepareStatement(selectSql);
		pstmt.setString(1, Id);
		pstmt.setString(2, password);
		
		ResultSet rs = pstmt.executeQuery();

		if(rs.next()) {
			String id = rs.getString("ID");
			
			out.println("로그인 성공");
			
			// tomcat 내장 session객체에 작성자를 저장
			session.setAttribute("id", id);
			
			// 로그인 성공 시 목록 페이지로 리다이렉션
%>
<script>
	alert('로그인에 성공했습니다.');
	location.href='<%= request.getContextPath() %>/admin_notice_list.jsp';
</script>
<%
		} else {
			System.out.println("로그인 실패: 아이디 또는 암호가 잘못되었습니다.");
			// 로그인 실패 시 로그인 폼으로 리다이렉션
%>
<script>
	alert('아이디 또는 비밀번호가 올바르지 않습니다.');
	location.href='<%= request.getContextPath() %>/admin_notice_login_form.jsp?error=invalid';
</script>
<%
		}
		
		rs.close();
		pstmt.close();
		
	} catch(Exception e) {
		ex1 = e;
		System.out.println("공지사항 로그인 쿼리 실행 오류: " + e.getMessage());
	}
	
	if (ex1 != null) {		// 로그인 시도 시 오류일 때 처리
%>
<script>
	alert('공지사항 관리자 로그인이 실패하였습니다. 시스템 관리자에게 문의하세요.\n오류내용: <%= ex1.getMessage() %>');
	location.href='<%= request.getContextPath() %>/admin_notice_list.jsp';
</script>
<%
	}
%>