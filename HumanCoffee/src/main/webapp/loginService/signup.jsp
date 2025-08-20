<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="com.humancoffee.common.*" %>
<%@ page import="com.humancoffee.manager.*" %>
<%@ page import="com.humancoffee.model.Customer" %>
<%@ page import="com.humancoffee.model.Com_Member" %>
<%@ page import = "com.humancoffee.*" %>
<%
    // 파라미터 받기
    String Id = request.getParameter("id");
    String password = request.getParameter("pw");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    
    HumanCoffee humanCoffeeInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
    ManageCustomers mCustomer = humanCoffeeInstance.mCustomers;
    ManageComMembers mComMember = humanCoffeeInstance.mComMems;
    
 	// 비밀번호 암호화를 위한 GenerateAlgorithm 객체 생성
    GenerateAlgorithm algo = new GenerateAlgorithm();
    
    try {
    	// Customer 객체 생성 및 데이터 설정
    	Customer customer = new Customer();
        customer.setId(Id);
        customer.setPwd(password);
        customer.setName(name);
        customer.setTel(tel);
        
     	// Com_Member 객체 생성 및 ID 설정
        Com_Member comMember = new Com_Member();
        comMember.setId(Id);
        
    	Customer rcv_customer = mCustomer.searchCustomerById(customer);
    	if(rcv_customer == null){
    		Com_Member rcv_com_member = mComMember.searchComMemberById(comMember);
    		if (rcv_com_member == null) {
    			String encryptedPassword = algo.generateSha256(Id, password);
                customer.setPwd(encryptedPassword);
        		
        		mCustomer.insertCustomer(customer);
    		} else {
    		%>    			
    			<script>
    			    alert('이미 존재하는 아이디입니다.');
    			    location.href='<%= request.getContextPath() %>/loginService/signin_form.jsp?error=invalid';
    		    </script>
    		<%     			
    		}
    		
%>
    <script>
	    alert('회원가입에  성공하였습니다.');
	    location.href='<%= request.getContextPath() %>/loginService/login_form.jsp';
    </script>
<%
    	} else {
%>    			
	<script>
	    alert('이미 존재하는 아이디입니다.');
	    location.href='<%= request.getContextPath() %>/loginService/signin_form.jsp?error=invalid';
    </script>
<%    			
    	}
	} catch (Exception e) {
%>
	<script>
		alert('회원가입 처리 중 오류가 발생하였습니다.');
	</script>
<%
		Common common = new Common();
		common.getStackTraceAsString(e);
	}
    
%>