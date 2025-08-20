<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="com.humancoffee.common.GenerateAlgorithm" %>
<%@ page import="com.humancoffee.model.Customer" %>
<%@ page import="com.humancoffee.manager.ManageCustomers" %>
<%@ page import="com.humancoffee.dao.OraConnect" %>

<%
	//post로 요청한 파라미터 조회 - 파라미터 이름 수정
	String Id = request.getParameter("id");
	String password = request.getParameter("pw");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");

	// 입력값 검증
    if (Id == null || password == null || name == null || tel == null ||
        Id.trim().isEmpty() || password.trim().isEmpty() || 
        name.trim().isEmpty() || tel.trim().isEmpty()) {
%>
        <script>
            alert('모든 정보를 입력해주세요.');
            history.back();
        </script>
<%
        return;
    }
	
	try {
		GenerateAlgorithm algo = new GenerateAlgorithm();
		Customer customer = new Customer();
		ManageCustomers mgCustomer = new ManageCustomers();
		
		// OraConnect 초기화
        mgCustomer.oraConn = new OraConnect();
		
     	// 고객 데이터를 메모리로 읽어오기 (중복 체크를 위해)
        mgCustomer.readCustomer(mgCustomer.memory_pos);
     	
    	// Customer 객체 설정
        customer.setId(Id);
        customer.setPwd(algo.generateSha256(Id, password)); // 패스워드 해시화
        customer.setName(name);
        customer.setTel(tel);
     // 중복 체크 (메모리에서)
        if (mgCustomer.searchCustomerById(customer)) {
            // 이미 존재하는 ID
%>
            <script>
                alert('이미 존재하는 아이디입니다.');
                location.href='<%= request.getContextPath() %>/loginService/signup_form.jsp';
            </script>
<%
        } else {
            // 새로운 고객 추가
            mgCustomer.insertCustomer(customer);
            
            // 실제 DB에 저장 실행
            boolean success = mgCustomer.oraConn.exeUpdate();
            
            if (success) {
                // 회원가입 성공
%>
                <script>
                    alert('회원가입에 성공했습니다.');
                    location.href='<%= request.getContextPath() %>/loginService/login_form.jsp';
                </script>
<%
            } else {
                // 회원가입 실패
%>
                <script>
                    alert('회원가입에 실패했습니다. 다시 시도해주세요.');
                    history.back();
                </script>
<%
            }
        }
        
        // 연결 종료
        mgCustomer.exit();
        if (mgCustomer.oraConn != null) {
            mgCustomer.oraConn.close();
        }
        
    } catch (Exception e) {
        System.out.println("회원가입 처리 중 오류: " + e.getMessage());
        e.printStackTrace();
%>
        <script>
            alert('시스템 오류가 발생했습니다. 관리자에게 문의하세요.');
            location.href='<%= request.getContextPath() %>/loginService/signup_form.jsp';
        </script>
<%
    }

%>