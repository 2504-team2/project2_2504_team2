<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="com.humancoffee.common.*" %>
<%@ page import="com.humancoffee.model.*" %>
<%@ page import="com.humancoffee.manager.*" %>
<%@ page import="com.humancoffee.*" %>

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
    GenerateAlgorithm algo = new GenerateAlgorithm();
	Customer customer = new Customer();
	customer.setId(Id);

	// ServletContext에서 HumanCoffee 객체를 가져옴
 	HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
	ManageCustomers mCustomers = hcInstance.mCustomers;
	Customer chkCustomer = mCustomers.searchCustomerById(customer);
	if(chkCustomer != null){
%>
        <script>
            alert('이미 존재하는 아이디입니다.');
            location.href='<%= request.getContextPath() %>/loginService/signup_form.jsp';
        </script>
<%
	}
	Com_Member com_member = new Com_Member();
	com_member.setId(Id);
	ManageComMembers mMembers = hcInstance.mComMems;
	Com_Member chk_com_member = mMembers.searchComMemberById(com_member);
	if(chk_com_member != null){
%>
        <script>
            alert('이미 존재하는 아이디입니다.');
            location.href='<%= request.getContextPath() %>/loginService/signup_form.jsp';
        </script>
<%
	}
	
	
	try {
		
     	
    	// Customer 객체 설정
        customer.setId(Id);
        customer.setPwd(algo.generateSha256(Id, password)); // 패스워드 해시화
        customer.setName(name);
        customer.setTel(tel);

        mCustomers.insertCustomer(customer);
        boolean success = true;

            
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
        
    } catch (Exception e) {
        Common common = new Common();
        String strException = common.getStackTraceAsString(e);
%>
        <script>
            alert('시스템 오류가 발생했습니다. 관리자에게 문의하세요.');
            location.href='<%= request.getContextPath() %>/loginService/signup_form.jsp';
        </script>
<%
    }

%>