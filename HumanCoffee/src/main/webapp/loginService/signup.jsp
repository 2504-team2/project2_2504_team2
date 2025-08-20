<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.humancoffee.DBManager" %>

<%
	// out 내장객체로 웹 페이지 출력
	out.println("<h1>회원가입 처리중입니다</h1>");

	// post로 요청한 파라미터 조회 - 파라미터 이름 수정
	String Id = request.getParameter("id");
	String password = request.getParameter("pw");
	String name = request.getParameter("name");
	String PHnumber = request.getParameter("tel");
	
	// 파라미터로 전달받은 데이터들을 DB에 저장
	Connection conn = DBManager.getDBConnection();
	Exception ex1 = null;
	try {
		String selectSql = "SELECT ID FROM CUSTOMER "
			+ "WHERE ID = ?";
		
		//PreparedStatement 얻기 및 값 지정
		PreparedStatement pstmt = conn.prepareStatement(selectSql);
		pstmt.setString(1, Id);
		
		ResultSet rs = pstmt.executeQuery();

		if(!rs.next()) {
			try {
				String insertSql = "INSERT INTO CUSTOMER (ID, PWD, NAME, TEL) "
						+ "VALUES(?, ?, ?, ?) ";
				//PreparedStatement 얻기 및 값 지정
				PreparedStatement pstmt2 = conn.prepareStatement(insertSql);
				pstmt.setString(1, Id);		 // varchar2
				pstmt.setString(2, password);    // varchar2
				pstmt.setString(3, name);		 // varchar2
				pstmt.setString(4, PHnumber);    // varchar2
				
				//SQL문 실행
				int rows = pstmt2.executeUpdate();
				
				pstmt2.close();
			
			
			// 로그인 성공 시 목록 페이지로 리다이렉션
%>
<script>
	alert('회원가입에 성공했습니다.');
	location.href='<%= request.getContextPath() %>/login.jsp';
</script>
<%
			} catch (Exception e) {
				
			}
		} else {
			System.out.println("회원가입 실패: 이미 존재하는 아이디입니다.");
			// 회원가입 실패 시 로그인 폼으로 리다이렉션
%>
<script>
	alert('이미 존재하는 아이디입니다.');
	location.href='<%= request.getContextPath() %>/loginService/login_form.jsp?error=invalid';
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
	location.href='<%= request.getContextPath() %>/index.jsp';
</script>
<%
	}
%>